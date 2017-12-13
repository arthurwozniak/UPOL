package cz.upol.inf.tma.demeter;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 * A simple {@link Fragment} subclass.
 * Activities that contain this fragment must implement the
 * {@link LogEntryListFragment.OnFragmentInteractionListener} interface
 * to handle interaction events.
 * Use the {@link LogEntryListFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class LogEntryListFragment extends Fragment {
    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    public static final String LOG_NAME = "LogEntryListFragment";
    public static final String ENTRIES  = "entries";

    public static final int    REQUEST_CODE_EDIT_ENTRY = 61;





    // TODO: Rename and change types of parameters
    private ArrayList<LogEntry> logEntries;
    private ListView            listView;
    private LogEntryAdapter     adapter;
    private int                 lastPressedItem;

    private OnFragmentInteractionListener mListener;

    public LogEntryListFragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @return A new instance of fragment LogEntryListFragment.
     */
    // TODO: Rename and change types and number of parameters
    public static LogEntryListFragment newInstance(ArrayList<LogEntry> entries) {
        LogEntryListFragment fragment = new LogEntryListFragment();
        Log.d(LOG_NAME, "newInstance; Entries: " + entries);
        Bundle args = new Bundle();
        args.putSerializable(ENTRIES, (Serializable) entries);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            logEntries = (ArrayList<LogEntry>)getArguments().getSerializable(ENTRIES);
            Log.d(LOG_NAME, "Entries: " + logEntries);

        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment

        View rootView = inflater.inflate(R.layout.fragment_log_entry_list, container, false);
        listView = (ListView)rootView.findViewById(R.id.logEntryListView);
        //ArrayAdapter<LogEntry> adapter = new ArrayAdapter<>(getActivity().getApplicationContext(), android.R.layout.simple_spinner_item, logEntries);
        adapter = new LogEntryAdapter(getContext(), logEntries);
        //adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        Log.d(LOG_NAME, "Adapter: " + adapter);
        listView.setAdapter(adapter);
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Log.d(LOG_NAME, "Item at pos: " + position + " clicked");
                lastPressedItem = position;
                Intent i = new Intent(getContext(), NewLogEntryActivity.class);
                i.putExtra(NewLogEntryActivity.LOG_ENTRY, adapter.getItem(position));
                startActivityForResult(i, REQUEST_CODE_EDIT_ENTRY);
            }
        });

        return rootView;
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if((requestCode == REQUEST_CODE_EDIT_ENTRY) && (resultCode == NewLogEntryActivity.RESULT_ENTRY)){
            LogEntry le = (LogEntry)data.getSerializableExtra(NewLogEntryActivity.RESULT_LOG_ENTRY);
            Log.d(LOG_NAME, "Obtained modified entry: " + le);
            try {
                new DatabaseHelper(getContext()).getLogEntryDao().createOrUpdate(le);
                Log.d(LOG_NAME, "List: " + logEntries);
                //logEntries.remove(lastPressedItem);
                //logEntries.add(lastPressedItem, le);
                logEntries.set(lastPressedItem, le);
                //adapter.clear();
                //adapter.addAll(logEntries);
                Log.d(LOG_NAME, "List size: " + logEntries.size());
                Log.d(LOG_NAME, "Adapter size: " + adapter.getCount());
                adapter.notifyDataSetChanged();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // TODO: Rename method, update argument and hook method into UI event
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
