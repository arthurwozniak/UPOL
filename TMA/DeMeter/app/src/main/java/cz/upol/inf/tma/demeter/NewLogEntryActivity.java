package cz.upol.inf.tma.demeter;

import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.content.Intent;
import android.os.Parcelable;
import android.support.design.widget.Snackbar;
import android.support.v4.app.NavUtils;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.TimePicker;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class NewLogEntryActivity extends AppCompatActivity {

    public static final String METERS           = "METERS";
    public static final String LOG_ENTRY        = "ENTRY";
    public static final String RESULT_LOG_ENTRY = "RESULT_LOG_ENTRY";
    public static final String LOG_NAME         = "NewLogEntryActivity";

    public static final int    RESULT_ENTRY     = 71;


    private ArrayList<Meter> meters;
    private MeterAdapter    meterAdapter;

    private LogEntry    entry = null;

    private Button      dateBtn;
    private Button      timeBtn;
    private Button      saveBtn;
    private EditText    dateInput;
    private EditText    timeInput;
    private EditText    lowInput;
    private EditText    highInput;
    private Spinner     spinner;

    private DateFormat  dateFormat;

    private int mYear, mMonth, mDay, mHour, mMinute;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_new_log_entry);

        entry = (LogEntry)getIntent().getSerializableExtra(LOG_ENTRY);

        dateFormat = new SimpleDateFormat("dd-MM-yyy HH:mm");
        meters = (ArrayList<Meter>) getIntent().getSerializableExtra(METERS);

        spinner = (Spinner)findViewById(R.id.new_log_entry_spinner);
        if(entry != null){
            Log.d(LOG_NAME, String.valueOf(entry));
            meters = new ArrayList<>();
            meters.add(entry.getMeter());
        }
        ArrayAdapter<Meter> adapter = new ArrayAdapter<Meter>(this, android.R.layout.simple_spinner_item, meters);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapter);

        dateBtn = (Button)findViewById(R.id.new_log_entry_date_btn);
        timeBtn = (Button)findViewById(R.id.new_log_entry_time_btn);
        saveBtn = (Button)findViewById(R.id.new_log_entry_save_btn);

        dateInput = (EditText)findViewById(R.id.new_log_entry_date_input);
        timeInput = (EditText)findViewById(R.id.new_log_entry_time_input);
        lowInput  = (EditText)findViewById(R.id.new_log_entry_low_input);
        highInput = (EditText)findViewById(R.id.new_log_entry_high_input);

        if(entry == null) {
            final Calendar c = Calendar.getInstance();
            dateInput.setText(c.get(Calendar.DAY_OF_MONTH) + "-" +
                    (c.get(Calendar.MONTH) + 1) + "-" + c.get(Calendar.YEAR));
            timeInput.setText(c.get(Calendar.HOUR_OF_DAY) + ":" + c.get(Calendar.MINUTE));
        } else {
            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyy");
            DateFormat timeFormat = new SimpleDateFormat("HH:mm");
            dateInput.setText(dateFormat.format(entry.getDate()));
            timeInput.setText(timeFormat.format(entry.getDate()));
            lowInput.setText(Integer.toString(entry.getLowValue()));
            highInput.setText(Integer.toString(entry.getHighValue()));

        }



        dateBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onDateBtnClick(v);
            }
        });

        timeBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onTimeBtnClick(v);
            }
        });

        saveBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onSaveBtnClick(v);
            }
        });


    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case android.R.id.home:
                NavUtils.navigateUpFromSameTask(this);
                return true;
        }

        return super.onOptionsItemSelected(item);
    }


    private void onDateBtnClick(View v) {

            // Get Current Date
            final Calendar c = Calendar.getInstance();
            mYear = c.get(Calendar.YEAR);
            mMonth = c.get(Calendar.MONTH);
            mDay = c.get(Calendar.DAY_OF_MONTH);


            DatePickerDialog datePickerDialog = new DatePickerDialog(this,
                    new DatePickerDialog.OnDateSetListener() {

                        @Override
                        public void onDateSet(DatePicker view, int year,
                                              int monthOfYear, int dayOfMonth) {

                            dateInput.setText(dayOfMonth + "-" + (monthOfYear + 1) + "-" + year);

                        }
                    }, mYear, mMonth, mDay);
            datePickerDialog.show();
        }

    private void onTimeBtnClick(View v){
        // Get Current Time
        final Calendar c = Calendar.getInstance();
        mHour = c.get(Calendar.HOUR_OF_DAY);
        mMinute = c.get(Calendar.MINUTE);

        // Launch Time Picker Dialog
        TimePickerDialog timePickerDialog = new TimePickerDialog(this,
                new TimePickerDialog.OnTimeSetListener() {


                    @Override
                    public void onTimeSet(TimePicker view, int hourOfDay,
                                          int minute) {

                        timeInput.setText(hourOfDay + ":" + minute);
                    }
                }, mHour, mMinute, true);
        timePickerDialog.show();

    }

    private void onSaveBtnClick(View v){
        Date date = null;
        try {
            date = dateFormat.parse(dateInput.getText().toString() + " " + timeInput.getText().toString());
        } catch (ParseException e) {
            e.printStackTrace();
            Snackbar.make(v, "Date and/or time is not valid!", Snackbar.LENGTH_LONG)
                    .setAction("Action", null).show();
            return;
        }

        if(lowInput.getText().toString().isEmpty() ||
                highInput.getText().toString().isEmpty()){
            Snackbar.make(v, "Values cannot be empty!", Snackbar.LENGTH_LONG)
                    .setAction("Action", null).show();
            return;
        }

        LogEntry le;
        if(entry == null) {
            le = new LogEntry((Meter) spinner.getSelectedItem(), date,
                    Integer.parseInt(lowInput.getText().toString()),
                    Integer.parseInt(highInput.getText().toString()));
        } else {
            le = entry;
            le.setDate(date);
            le.setLowValue(Integer.parseInt(lowInput.getText().toString()));
            le.setHighValue(Integer.parseInt(highInput.getText().toString()));
        }
        Log.d(LOG_NAME, "Returning new log entry: " + le);
        Intent resultData = new Intent();
        resultData.putExtra(RESULT_LOG_ENTRY, le);
        setResult(RESULT_ENTRY, resultData);
        finish();
    }

}
