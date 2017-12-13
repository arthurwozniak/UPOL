package cz.upol.inf.tma.demeter;

import android.util.Log;

import com.j256.ormlite.dao.ForeignCollection;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.field.ForeignCollectionField;
import com.j256.ormlite.table.DatabaseTable;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

/**
 * Created by kamil on 5.12.16.
 */

@DatabaseTable
public class Meter implements Serializable {

    @DatabaseField(generatedId = true)
    private
    int id;

    @DatabaseField
    private
    String name;

    @ForeignCollectionField(eager = false, orderColumnName = LogEntry.DATE_FIELD_NAME)
    private
    ForeignCollection<LogEntry> entries;


    public Meter() {

    }

    public Meter(String name) {
        this.setName(name);
    }

    public LogEntry getLast() {
        if ((entries == null) ||
                entries.isEmpty()) return null;

        final Iterator itr = entries.iterator();
        LogEntry lastElement = null;
        while (itr.hasNext()) {
            lastElement = (LogEntry) itr.next();

        }
        return lastElement;

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ForeignCollection<LogEntry> getEntries() {
        return entries;
    }

    @Override
    public boolean equals(Object other) {
        if (other == null || other.getClass() != getClass()) {
            return false;
        }
        return name.equals(((Meter) other).name);
    }

    @Override
    public String toString() {
        return name;
    }
}
