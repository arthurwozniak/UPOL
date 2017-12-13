package cz.upol.inf.tma.demeter;

import android.content.Intent;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;

import android.widget.TextView;

import com.j256.ormlite.dao.ForeignCollection;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

public class MeterOverviewActivity extends AppCompatActivity {

    public static final String METER = "METER";
    public static final String LOG_NAME = "MeterOverviewActivity";

    /**
     * Result codes
     */
    public static final int RESULT_CODE_METER_DELETED = 50;
    public static final int RESULT_CODE_METER_RENAMED = 51;
    public static final int RESULT_CODE_DATA_CHANGED  = 52;

    private SectionsPagerAdapter mSectionsPagerAdapter;



    /**
     * The {@link ViewPager} that will host the section contents.
     */
    private ViewPager mViewPager;
    private Meter meter;
    private Toolbar toolbar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_meter_overview);

        toolbar = (Toolbar) findViewById(R.id.meter_overview_toolbar);
        setSupportActionBar(toolbar);

        meter = (Meter) getIntent().getSerializableExtra(METER);
        Log.d(LOG_NAME, "Obtained meter: " + meter);
        toolbar.setTitle(meter.getName());
        // Create the adapter that will return a fragment for each of the three
        // primary sections of the activity.
        mSectionsPagerAdapter = new SectionsPagerAdapter(getSupportFragmentManager(), meter);

        // Set up the ViewPager with the sections adapter.
        mViewPager = (ViewPager) findViewById(R.id.container);
        mViewPager.setAdapter(mSectionsPagerAdapter);


        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });

    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_meter_overview, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();


        return super.onOptionsItemSelected(item);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();

    }

    /**
     * A {@link FragmentPagerAdapter} that returns a fragment corresponding to
     * one of the sections/tabs/pages.
     */
    public class SectionsPagerAdapter extends FragmentPagerAdapter {

        private Meter m;

        public SectionsPagerAdapter(FragmentManager fm) {
            super(fm);
        }

        public SectionsPagerAdapter(FragmentManager fm, Meter meter) {
            super(fm);
            try {
                m = new DatabaseHelper(getApplicationContext()).getMeterDao().queryForId(meter.getId());
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        @Override
        public Fragment getItem(int position) {
            // getItem is called to instantiate the fragment for the given page.
            // Return a PlaceholderFragment (defined as a static inner class below).
            if (position == 0) {

                Log.d(LOG_NAME, "Meter: " + m + " entries: " + m.getEntries());
                ArrayList<LogEntry> list = new ArrayList<>();
                ForeignCollection<LogEntry> entries = m.getEntries();
                try {
                    entries.refreshCollection();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                Log.d(LOG_NAME, "Entries: " + entries);

                Iterator<LogEntry> itr = entries.iterator();
                //LogEntry last = itr.hasNext() ? itr.next() : null;
                //Log.d(LOG_NAME, "Entry: " + last);
                if (!itr.hasNext())
                    return LogEntryListFragment.newInstance(list);
                LogEntry last;
                while (itr.hasNext()) {
                    last = itr.next();
                    list.add(last);
                    Log.d(LOG_NAME, "Entry: " + last);

                }
                return LogEntryListFragment.newInstance(list);

            }

            if(position == 1){
                return MeterSettingFragment.newInstance(m);
            }
            //return PlaceholderFragment.newInstance(position + 1);

            return MeterChartFragment.newInstance(m);
        }

        @Override
        public int getCount() {
            // Show 3 total pages.
            return 3;
        }

        @Override
        public CharSequence getPageTitle(int position) {
            switch (position) {
                case 0:
                    return "SECTION 1";
                case 1:
                    return "SECTION 2";
                case 2:
                    return "SECTION 3";
            }
            return null;
        }
    }
}
