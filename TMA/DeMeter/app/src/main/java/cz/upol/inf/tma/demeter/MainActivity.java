package cz.upol.inf.tma.demeter;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.AdapterView;
import android.widget.ListView;

import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.dao.ForeignCollection;

import java.io.Serializable;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    public static final int REQUEST_CODE_NEW_METER    = 42;
    public static final int REQUEST_CODE_NEW_ENTRY    = 43;
    public static final int REQUEST_CODE_METER_DETAIL = 44;
    public static final String LOG_NAME = "MainActivity";

    private DatabaseHelper          helper;
    private Dao<Meter, Integer>     meterDao    = null;
    private Dao<LogEntry, Integer>  logEntryDao = null;

    private List<Meter>         metersList = new ArrayList<>();
    private MeterAdapter        metersAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (metersAdapter.getCount() == 0) {
                    Snackbar.make(view, "Firstly create meter", Snackbar.LENGTH_LONG)
                            .setAction("Action", null).show();
                    return;
                }
                Intent i = new Intent(MainActivity.this, NewLogEntryActivity.class);
                i.putExtra(NewLogEntryActivity.METERS, (Serializable) metersList);
                startActivityForResult(i, REQUEST_CODE_NEW_ENTRY);
            }
        });

        final ListView metersView = (ListView)findViewById(R.id.mainActivityListView);
        metersView.setOnItemClickListener(new ListView.OnItemClickListener() {

            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent i = new Intent(MainActivity.this, MeterOverviewActivity.class);
                Log.d(LOG_NAME, "Selected meter: " + parent.getItemAtPosition(position));
                i.putExtra(MeterOverviewActivity.METER, (Meter)parent.getItemAtPosition(position));
                startActivityForResult(i, REQUEST_CODE_METER_DETAIL);
            }
        });

        metersAdapter = new MeterAdapter(this, metersList);
        metersView.setAdapter(metersAdapter);



        helper = new DatabaseHelper(this);
        try {
            meterDao = helper.getMeterDao();
            logEntryDao = helper.getLogEntryDao();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            metersList = meterDao.queryForAll();
            metersAdapter.addAll(metersList);
            metersAdapter.notifyDataSetChanged();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        Log.d("Adapter size", String.valueOf(metersAdapter.getCount()));

        /*
        try {
            makeTestData();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        */


        /*
        Meter m = new Meter("testovaci");
        Log.d("MainActivity", "Testovaci: " + m);
        try {
            meterDao.createOrUpdate(m);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        LogEntry le = new LogEntry(m, new Date(), 1234);

        Meter meterResult = null;
        try {
            meterResult = meterDao.queryForId(m.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        ForeignCollection<LogEntry> high = meterResult.getHigh();
        high.add(le);



        try {
            meterDao.createOrUpdate(m);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        */




    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();


        if (id == R.id.action_new_meter){
            Intent i  = new Intent(this, NewMeterActivity.class);
            startActivityForResult(i, REQUEST_CODE_NEW_METER);
        }

        return super.onOptionsItemSelected(item);
    }



    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        Log.d(LOG_NAME, "Activity result obtained. Request code: " + requestCode);
        Log.d(LOG_NAME, "Activity result obtained. Result code: " + requestCode);

        if((requestCode == REQUEST_CODE_NEW_METER) && (data != null)){
            String name = data.getStringExtra(NewMeterActivity.RESULT_NAME);
            Log.d(LOG_NAME, "Obtained new meter name: " + name );
            Meter m = new Meter(name);
            Meter meterResult;
            try {
                meterDao.create(m);
                meterResult = meterDao.queryForId(m.getId());
            } catch (SQLException e) {
                e.printStackTrace();
                return;
            }
            metersList.add(meterResult);
            metersAdapter.add(meterResult);
            listMeters();
            return;
        }
        if((requestCode == REQUEST_CODE_NEW_ENTRY) && (data != null)){
            LogEntry le = (LogEntry) data.getSerializableExtra(NewLogEntryActivity.RESULT_LOG_ENTRY);
            Log.d(LOG_NAME, "Obtained new entry: " + le);
            try {
                Meter meterResult = meterDao.queryForId(le.getMeter().getId());
                ForeignCollection<LogEntry> entries = meterResult.getEntries();
                boolean changed = ((meterResult.getLast() == null) ||
                        (meterResult.getLast().getDate().compareTo(le.getDate()) == -1));
                entries.add(le);
                meterDao.createOrUpdate(meterResult);
                if (changed) {
                    Log.d(LOG_NAME, "Obtained newer log, refreshing adapter.");
                    metersAdapter.notifyDataSetChanged();
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
            //listMeters();
        }

        if (requestCode == REQUEST_CODE_METER_DETAIL){
            Log.d(LOG_NAME, "Returned from " + MeterOverviewActivity.LOG_NAME);
            if (resultCode == MeterOverviewActivity.RESULT_CODE_METER_DELETED) {
                Log.d(LOG_NAME, "Meter deleted");
            }
            if (resultCode == MeterOverviewActivity.RESULT_CODE_METER_RENAMED){
                Log.d(LOG_NAME, "Meter renamed");
            }
            reloadMetersFromDB();

        }
    }

    private void makeTestData() throws SQLException, ParseException {
        Meter m = new Meter("Test data");
        meterDao.create(m);
        m = meterDao.queryForId(m.getId());
        ForeignCollection<LogEntry> entries = m.getEntries();
        LogEntry le = null;
        DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyy HH:mm:ss");
        le = new LogEntry(m, dateFormat.parse("16.10.2015 16:00:00"), 1479, 1556);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("6.11.2015 8:45:00"), 1576, 1654);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("26.11.2015 14:00:00"), 1662, 1749);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("3.12.2015 12:00:00"), 1684, 1778);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("14.12.2015 9:30:00"), 1721, 1832);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("2.1.2016 14:00:00"), 1800, 1939);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("13.1.2016 10:15:00"), 1831, 1988);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("15.1.2016 9:55:00"), 1836, 1993);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("16.1.2016 12:15:00"), 1840, 1997);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("18.1.2016 10:30:00"), 1846, 2003);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("20.1.2016 10:30:00"), 1850, 2009);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("21.1.2016 10:50:00"), 1851, 2014);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("22.1.2016 17:00:00"), 1852, 2018);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("23.1.2016 10:50:00"), 1853, 2022);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("24.1.2016 10:30:00"), 1856, 2030);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("25.1.2016 15:00:00"), 1858, 2035);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("26.1.2016 10:30:00"), 1859, 2037);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("27.1.2016 10:30:00"), 1860, 2040);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("31.1.2016 21:45:00"), 1866, 2062);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("1.2.2016 10:30:00"), 1867, 2063);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("2.2.2016 10:30:00"), 1868, 2067);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("3.2.2016 10:30:00"), 1869, 2070);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("4.2.2016 10:30:00"), 1871, 2073);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("5.2.2016 10:30:00"), 1872, 2075);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("6.2.2016 10:30:00"), 1872, 2078);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("7.2.2016 10:30:00"), 1876, 2083);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("8.2.2016 11:00:00"), 1879, 2087);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("9.2.2016 10:30:00"), 1880, 2091);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("10.2.2016 14:15:00"), 1881, 2095);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("11.2.2016 11:00:00"), 1882, 2098);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("15.2.2016 15:00:00"), 1892, 2120);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("17.2.2016 14:00:00"), 1895, 2127);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("22.2.2016 14:30:00"), 1903, 2148);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("29.2.2016 11:30:00"), 1916, 2178);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("4.3.2016 10:00:00"), 1920, 2190);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("7.3.2016 11:00:00"), 1927, 2206);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("11.3.2016 16:30:00"), 1932, 2222);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("12.3.2016 11:30:00"), 1933, 2224);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("13.3.2016 11:30:00"), 1937, 2228);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("14.3.2016 12:00:00"), 1940, 2235);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("15.3.2016 12:00:00"), 1940, 2237);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("16.3.2016 12:00:00"), 1942, 2242);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("18.3.2016 12:45:00"), 1945, 2250);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("20.3.2016 12:00:00"), 1949, 2260);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("23.3.2016 11:45:00"), 1952, 2272);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("25.3.2016 12:10:00"), 1956, 2277);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("26.3.2016 12:45:00"), 1957, 2280);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("27.3.2016 13:00:00"), 1960, 2287);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("28.3.2016 12:40:00"), 1963, 2292);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("30.3.2016 12:30:00"), 1964, 2298);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("1.4.2016 17:00:00"), 1967, 2304);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("2.4.2016 12:00:00"), 1968, 2307);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("4.4.2016 12:00:00"), 1971, 2318);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("6.4.2016 12:00:00"), 1974, 2324);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("8.4.2016 12:00:00"), 1976, 2328);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("9.4.2016 12:00:00"), 1977, 2331);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("10.4.2016 12:00:00"), 1978, 2337);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("12.4.2016 12:00:00"), 1983, 2347);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("13.4.2016 12:00:00"), 1984, 2350);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("15.4.2016 12:00:00"), 1986, 2355);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("17.4.2016 18:00:00"), 2001, 2367);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("18.4.2016 12:00:00"), 2001, 2369);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("19.4.2016 12:00:00"), 2004, 2373);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("20.4.2016 13:30:00"), 2005, 2377);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("22.4.2016 12:30:00"), 2008, 2387);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("24.4.2016 12:00:00"), 2011, 2394);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("25.4.2016 12:00:00"), 2012, 2399);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("26.4.2016 12:00:00"), 2013, 2401);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("27.4.2016 12:00:00"), 2014, 2404);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("30.4.2016 14:20:00"), 2018, 2414);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("1.5.2016 13:30:00"), 2021, 2422);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("2.5.2016 12:00:00"), 2023, 2427);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("3.5.2016 12:00:00"), 2024, 2432);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("4.5.2016 13:00:00"), 2026, 2436);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("6.5.2016 13:30:00"), 2029, 2445);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("8.5.2016 12:00:00"), 2038, 2454);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("9.5.2016 12:00:00"), 2039, 2457);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("11.5.2016 12:00:00"), 2043, 2462);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("13.5.2016 16:00:00"), 2054, 2468);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("14.5.2016 12:00:00"), 2055, 2471);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("16.5.2016 12:00:00"), 2058, 2479);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("18.5.2016 12:00:00"), 2060, 2484);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("19.5.2016 12:00:00"), 2062, 2487);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("24.5.2016 12:00:00"), 2090, 2509);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("26.5.2016 12:00:00"), 2097, 2513);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("27.5.2016 12:00:00"), 2102, 2517);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("28.5.2016 12:00:00"), 2109, 2520);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("30.5.2016 12:00:00"), 2120, 2529);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("31.5.2016 13:00:00"), 2126, 2533);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("5.6.2016 13:00:00"), 2150, 2550);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("6.6.2016 12:00:00"), 2158, 2554);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("7.6.2016 12:00:00"), 2162, 2556);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("8.6.2016 12:00:00"), 2165, 2558);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("14.6.2016 13:00:00"), 2197, 2580);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("16.6.2016 12:00:00"), 2206, 2585);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("17.6.2016 12:30:00"), 2210, 2587);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("18.6.2016 12:00:00"), 2216, 2592);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("21.6.2016 13:00:00"), 2236, 2604);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("2.7.2016 15:00:00"), 2293, 2644);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("10.7.2016 20:00:00"), 2330, 2671);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("12.7.2016 20:00:00"), 2341, 2680);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("18.7.2016 19:00:00"), 2375, 2705);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("29.7.2016 19:00:00"), 2440, 2748);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("4.8.2016 20:00:00"), 2470, 2771);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("8.8.2016 8:00:00"), 2497, 2791);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("11.8.2016 10:30:00"), 2517, 2805);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("24.8.2016 20:15:00"), 2601, 2861);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("31.8.2016 20:15:00"), 2642, 2887);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("15.9.2016 21:30:00"), 2723, 2941);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("26.9.2016 21:15:00"), 2773, 2980);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("7.10.2016 10:00:00"), 2822, 3024);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("16.10.2016 9:40:00"), 2865, 3093);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("17.10.2016 10:15:00"), 2866, 3099);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("21.10.2016 18:00:00"), 2871, 3119);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("28.10.2016 17:45:00"), 2883, 3146);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("4.11.2016 10:00:00"), 2898, 3174);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("7.11.2016 10:00:00"), 2905, 3188);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("11.11.2016 11:00:00"), 2908, 3203);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("14.11.2016 10:30:00"), 2915, 3218);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("17.11.2016 12:00:00"), 2919, 3230);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("19.11.2016 16:00:00"), 2922, 3240);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("28.11.2016 17:45:00"), 2942, 3281);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("1.12.2016 12:00:00"), 2947, 3289);
        entries.add(le);
        le = new LogEntry(m, dateFormat.parse("4.12.2016 15:30:00"), 2953, 3303);
        entries.add(le);
        metersAdapter.notifyDataSetChanged();

    }


    private void reloadMetersFromDB(){
        try {
            metersList = meterDao.queryForAll();
            metersAdapter.clear();
            metersAdapter.addAll(metersList);
            metersAdapter.notifyDataSetChanged();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void listMeters(){
        Log.d(LOG_NAME, "Listing all meters...");
        try {
            for (Meter m : meterDao.queryForAll()){
                Log.d(LOG_NAME, "Meter: " + m.getName());
                for(LogEntry le : m.getEntries()){
                    Log.d(LOG_NAME, "Entry: " + le);

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
