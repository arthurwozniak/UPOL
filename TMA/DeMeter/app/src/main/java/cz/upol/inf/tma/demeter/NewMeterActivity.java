package cz.upol.inf.tma.demeter;

import android.content.Intent;
import android.support.design.widget.Snackbar;
import android.support.v4.app.NavUtils;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import org.w3c.dom.Text;

import java.util.List;

public class NewMeterActivity extends AppCompatActivity {
    public static final String RESULT_NAME = "NAME";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_new_meter);
        //getActionBar().setDisplayHomeAsUpEnabled(true);


        Button b = (Button)findViewById(R.id.new_meter_button);
        final TextView view = (TextView)findViewById(R.id.meterNameInput);


        b.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                if (view.getText().toString().isEmpty()){
                    Snackbar.make(v, "Name cannot be empty!", Snackbar.LENGTH_LONG)
                            .setAction("Action", null).show();
                    return;
                }
                Log.d(this.getClass().getName(), "Returning meter name: " + view.getText().toString());
                Intent resultData = new Intent();
                resultData.putExtra(RESULT_NAME, view.getText().toString());
                setResult(MainActivity.REQUEST_CODE_NEW_METER, resultData);
                finish();
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
}
