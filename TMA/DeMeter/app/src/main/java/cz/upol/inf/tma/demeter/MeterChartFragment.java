package cz.upol.inf.tma.demeter;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.github.mikephil.charting.charts.LineChart;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.LineData;
import com.github.mikephil.charting.data.LineDataSet;
import com.github.mikephil.charting.interfaces.datasets.ILineDataSet;
import com.github.mikephil.charting.utils.ColorTemplate;
import com.j256.ormlite.dao.ForeignCollection;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;


/**
 * A simple {@link Fragment} subclass.
 * Activities that contain this fragment must implement the
 * {@link MeterChartFragment.OnFragmentInteractionListener} interface
 * to handle interaction events.
 * Use the {@link MeterChartFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class MeterChartFragment extends Fragment {
    public static final String LOG_NAME = "MeterChartFragment";

    private static final String METER = "meter";


    private Meter meter;

    private OnFragmentInteractionListener mListener;

    public MeterChartFragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param meter Meter instance.
     * @return A new instance of fragment MeterChartFragment.
     */
    // TODO: Rename and change types and number of parameters
    public static MeterChartFragment newInstance(Meter meter) {
        MeterChartFragment fragment = new MeterChartFragment();
        Bundle args = new Bundle();
        args.putSerializable(METER, meter);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            meter = (Meter) getArguments().getSerializable(METER);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View rootView = inflater.inflate(R.layout.fragment_meter_chart, container, false);
        LineChart lineChart = (LineChart) rootView.findViewById(R.id.meter_chart);


        ForeignCollection<LogEntry> lazy_entries =  meter.getEntries();
        try {
            lazy_entries.refreshCollection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Iterator<LogEntry> itr = lazy_entries.iterator();
        List<LogEntry> entries = new ArrayList<>();
        LogEntry le;
        while(itr.hasNext()){
            le = itr.next();
            entries.add(le);

        }
        Log.d(LOG_NAME, "Entries: " + entries);

        if (entries.isEmpty())
            return rootView;

        List<Entry> chart_entries_high = new ArrayList<>();
        List<Entry> chart_entries_low = new ArrayList<>();
        for (LogEntry logEntry : entries){
            chart_entries_high.add(new Entry(logEntry.getDate().getTime(), logEntry.getHighValue()));
            chart_entries_low.add(new Entry(logEntry.getDate().getTime(), logEntry.getLowValue()));
        }

        XAxis xAxis = lineChart.getXAxis();
        xAxis.setValueFormatter(new XAxisDateFormatter());
        xAxis.setLabelCount(4);

        LineDataSet dataSetHigh = new LineDataSet(chart_entries_high, getResources()
                .getString(R.string.high_value));
        dataSetHigh.setColor(ColorTemplate.MATERIAL_COLORS[0]);
        dataSetHigh.setDrawCircles(false);

        LineDataSet dataSetLow = new LineDataSet(chart_entries_low, getResources()
                .getString(R.string.low_value));
        dataSetLow.setColor(ColorTemplate.MATERIAL_COLORS[1]);
        dataSetLow.setDrawCircles(false);

        List<ILineDataSet> dataSets = new ArrayList<ILineDataSet>();
        dataSets.add(dataSetLow);
        dataSets.add(dataSetHigh);


        LineData lineData = new LineData(dataSets);
        lineChart.setData(lineData);
        lineChart.invalidate();
        lineChart.setScaleXEnabled(true);
        lineChart.setScaleYEnabled(false);
        lineChart.setDescription(null);
        lineChart.getAxisLeft().setEnabled(false);

        return rootView;
    }

    // TODO: Rename method  , update argument and hook method into UI event
    public void onButtonPressed(Uri uri) {
        if (mListener != null) {
            mListener.onFragmentInteraction(uri);
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    /**
     * This interface must be implemented by activities that contain this
     * fragment to allow an interaction in this fragment to be communicated
     * to the activity and potentially other fragments contained in that
     * activity.
     * <p>
     * See the Android Training lesson <a href=
     * "http://developer.android.com/training/basics/fragments/communicating.html"
     * >Communicating with Other Fragments</a> for more information.
     */
    public interface OnFragmentInteractionListener {
        // TODO: Update argument type and name
        void onFragmentInteraction(Uri uri);
    }
}
