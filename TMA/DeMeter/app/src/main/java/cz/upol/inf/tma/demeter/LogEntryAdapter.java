package cz.upol.inf.tma.demeter;

import android.content.Context;
import android.support.annotation.NonNull;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.TextView;

import com.j256.ormlite.dao.ForeignCollection;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by kamil on 6.12.16.
 */

public class LogEntryAdapter extends ArrayAdapter<LogEntry> {

    public static final String LOG_NAME = "LogEntryAdapter";

    private Context mContext;

    public LogEntryAdapter(Context context, List<LogEntry> entries){
        super(context, 0, entries);
        mContext = context;
    }


    @NonNull
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        final LogEntry entry = getItem(position);

        if (convertView == null) {
            convertView = LayoutInflater.from(getContext()).inflate(R.layout.log_entry_item_layout, parent, false);
        }

        TextView lowValue  = (TextView)convertView.findViewById(R.id.log_entry_item_low_val);
        TextView highValue = (TextView)convertView.findViewById(R.id.log_entry_item_high_val);
        TextView date      = (TextView)convertView.findViewById(R.id.log_entry_item_date);
        Button   deleteBtn = (Button)convertView.findViewById(R.id.log_entry_item_delete_btn);

        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyy HH:mm");

        lowValue.setText(Integer.toString(entry.getLowValue()));
        highValue.setText(Integer.toString(entry.getHighValue()));

        date.setText(dateFormat.format(entry.getDate()));


        deleteBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.d(LOG_NAME, "Deleting entry: " + entry);
                remove(entry);
                notifyDataSetChanged();
                try {
                    new DatabaseHelper(getContext()).getLogEntryDao().deleteById(entry.getId());
                } catch (SQLException e) {
                    e.printStackTrace();
                }

            }
        });




        return convertView;


    }
}
