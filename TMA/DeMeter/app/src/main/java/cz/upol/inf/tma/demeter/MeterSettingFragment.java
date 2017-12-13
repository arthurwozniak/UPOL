package cz.upol.inf.tma.demeter;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;

import com.j256.ormlite.dao.Dao;

import java.sql.SQLException;


/**
 * A simple {@link Fragment} subclass.
 * Activities that contain this fragment must implement the
 * {@link MeterSettingFragment.OnFragmentInteractionListener} interface
 * to handle interaction events.
 * Use the {@link MeterSettingFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class MeterSettingFragment extends Fragment {
    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String METER    = "meter";
    public static final String  LOG_NAME = "MeterSettingFragment";

    // TODO: Rename and change types of parameters
    private Meter    meter;
    private Button   saveBtn;
    private Button   deleteBtn;
    private EditText nameInput;

    private Dao<Meter, Integer> meterDao;

    private OnFragmentInteractionListener mListener;

    public MeterSettingFragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param m - Meter instance
     * @return A new instance of fragment MeterSettingFragment.
     */
    // TODO: Rename and change types and number of parameters
    public static MeterSettingFragment newInstance(Meter m) {
        MeterSettingFragment fragment = new MeterSettingFragment();
        Bundle args = new Bundle();
        args.putSerializable(METER, m);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            meter = (Meter)getArguments().getSerializable(METER);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View rootView = inflater.inflate(R.layout.fragment_meter_setting, container, false);

        saveBtn   = (Button)rootView.findViewById(R.id.setting_save_btn);
        deleteBtn = (Button)rootView.findViewById(R.id.setting_delete_btn);
        nameInput = (EditText)rootView.findViewById(R.id.setting_name_input);

        nameInput.setText(meter.getName());

        try {
            meterDao = new DatabaseHelper(getActivity().getApplicationContext()).getMeterDao();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        saveBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(!nameInput.getText().toString().isEmpty()){
                    meter.setName(nameInput.getText().toString());
                    try {
                        meterDao.createOrUpdate(meter);
                        getActivity().setResult(MeterOverviewActivity.RESULT_CODE_METER_RENAMED);
                        getActivity().finish();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        });

        deleteBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    Log.d(LOG_NAME, "Deleting meter: " + meter.getName());
                    meterDao.delete(meter);
                    getActivity().setResult(MeterOverviewActivity.RESULT_CODE_METER_DELETED);
                    getActivity().finish();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        });

        return rootView;
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
