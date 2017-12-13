package cz.upol.inf.tma.demeter;

import android.content.Context;
import android.support.annotation.NonNull;
import android.text.format.DateFormat;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.j256.ormlite.dao.ForeignCollection;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by kamil on 5.12.16.
 */

public class MeterAdapter extends ArrayAdapter<Meter> {

    public MeterAdapter(Context context, List<Meter> meters){
        super(context, 0, meters);
    }

    @NonNull
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        Meter meter = getItem(position);

        if (convertView == null) {
            convertView = LayoutInflater.from(getContext()).inflate(R.layout.meter_item_layout, parent, false);
        }

        TextView name = (TextView)convertView.findViewById(R.id.meter_item_name);
        TextView lowValue = (TextView)convertView.findViewById(R.id.meter_item_low_val);
        TextView highValue = (TextView)convertView.findViewById(R.id.meter_item_high_val);
        TextView lastUpdate = (TextView)convertView.findViewById(R.id.meter_item_last_update_val);

        name.setText(meter.getName());
        ForeignCollection<LogEntry> entries = meter.getEntries();


        LogEntry last = meter.getLast();
        if (last == null) {
            lowValue.setText(R.string.no_data);
            highValue.setText(R.string.no_data);
            lastUpdate.setText(R.string.never);

        }
        else {
            lowValue.setText(Integer.toString(last.getLowValue()));
            highValue.setText(Integer.toString(last.getHighValue()));
            java.text.DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyy HH:mm");
            lastUpdate.setText(dateFormat.format(last.getDate()));

        }


        return convertView;

    }
}
