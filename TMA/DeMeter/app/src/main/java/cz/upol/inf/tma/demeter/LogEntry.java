package cz.upol.inf.tma.demeter;

import com.j256.ormlite.field.DatabaseField;

import java.io.Serializable;
import java.text.DateFormat;
import java.util.Date;

/**
 * Created by kamil on 5.12.16.
 */


public class LogEntry implements Serializable, Comparable{

    public static final String METER_ID_FIELD_NAME  = "meter_id";
    public static final String DATE_FIELD_NAME      = "date";

    @DatabaseField(generatedId = true)
    private
    int id;

    @DatabaseField(foreign = true, foreignAutoRefresh = true, columnName = METER_ID_FIELD_NAME)
    private Meter meter;

    @DatabaseField(columnName = DATE_FIELD_NAME)
    private
    Date date;

    @DatabaseField
    private
    int lowValue;

    @DatabaseField
    private
    int highValue;

    public LogEntry(){

    }

    public LogEntry(Meter meter, Date date, int lowValue, int highValue){
        this.setMeter(meter);
        this.setDate(date);
        this.setLowValue(lowValue);
        this.setHighValue(highValue);

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }


    public Meter getMeter() {
        return meter;
    }

    public void setMeter(Meter meter) {
        this.meter = meter;
    }

    public int getLowValue() {
        return lowValue;
    }

    public void setLowValue(int lowValue) {
        this.lowValue = lowValue;
    }

    public int getHighValue() {
        return highValue;
    }

    public void setHighValue(int highValue) {
        this.highValue = highValue;
    }

    @Override
    public String toString() {
        return "{LogEntry: owner = " + meter.getName() + "; date = " + date +
                "; low = " + lowValue + "; high = " + highValue + "}";
    }


    @Override
    public int compareTo(Object o) {
        if((o != null) && (o instanceof LogEntry))
            return getDate().compareTo(((LogEntry)o).getDate());
        throw new UnsupportedOperationException("Uncomparable object");
    }
}
