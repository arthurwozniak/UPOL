package cz.upol.inf.tma.demeter;

import com.github.mikephil.charting.components.AxisBase;
import com.github.mikephil.charting.formatter.IAxisValueFormatter;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by kamil on 7.12.16.
 */

public class XAxisDateFormatter implements IAxisValueFormatter {
    private DateFormat dateFormat;


    public XAxisDateFormatter(){
        dateFormat = new SimpleDateFormat("dd.MM.yyyy");
    }

    @Override
    public String getFormattedValue(float value, AxisBase axis) {
        // "value" represents the position of the label on the axis (x or y)
        return dateFormat.format(new Date((long) value));
    }

}