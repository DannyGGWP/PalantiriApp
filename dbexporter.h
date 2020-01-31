#ifndef DBEXPORTER_H
#define DBEXPORTER_H

#include <QObject>
#include <QFile>
#include <QDir>
#include <QStandardPaths>

class DBExporter : public QObject
{
    Q_OBJECT
public:
    explicit DBExporter(QString offlineStoragePath,QObject *parent = nullptr);
public slots:
    void exportDBtoLoc(QString nameOfCopy);
signals:


private:
    QString m_offlineStoragePath;
};

#endif // DBEXPORTER_H
