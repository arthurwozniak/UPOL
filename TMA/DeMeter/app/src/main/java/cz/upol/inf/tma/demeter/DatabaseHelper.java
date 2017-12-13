package cz.upol.inf.tma.demeter;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;

import com.j256.ormlite.android.apptools.OrmLiteSqliteOpenHelper;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.support.ConnectionSource;
import com.j256.ormlite.table.TableUtils;

import java.sql.SQLException;

/**
 * Created by kamil on 5.12.16.
 */

public class DatabaseHelper extends OrmLiteSqliteOpenHelper {

    public static final String  DATABASE_NAME = "meters.db";
    public static final int     VERSION       = 3;

    private Dao<Meter, Integer> mMeterDao = null;
    private Dao<LogEntry, Integer> mLogEntryDao = null;

    public DatabaseHelper(Context context){
        super(context, DATABASE_NAME, null, VERSION);
    }


    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase, ConnectionSource connectionSource) {
        try{
            TableUtils.createTable(connectionSource, Meter.class);
            TableUtils.createTable(connectionSource, LogEntry.class);
        } catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, ConnectionSource connectionSource,
                          int oldVersion, int newVersion) {
        try{
            TableUtils.dropTable(connectionSource, Meter.class, true);
            TableUtils.dropTable(connectionSource, LogEntry.class, true);
            onCreate(sqLiteDatabase, connectionSource);
        } catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    /* DAO */
    public Dao<Meter, Integer> getMeterDao() throws SQLException {
        if(mMeterDao == null)
            mMeterDao = getDao(Meter.class);
        return mMeterDao;
    }

    public Dao<LogEntry, Integer> getLogEntryDao() throws SQLException {
        if(mLogEntryDao == null)
            mLogEntryDao = getDao(LogEntry.class);
        return mLogEntryDao;

    }



    @Override
    public void close() {
        mMeterDao = null;

        super.close();
    }
}
