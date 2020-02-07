#include "dbexporter.h"

DBExporter::DBExporter(QString offlineStoragePath, QObject *parent) : QObject(parent),
    m_offlineStoragePath(offlineStoragePath)
{

}

void DBExporter::exportDBtoLoc(QString nameOfCopy)
{
    QString newFilePath = QString("%1/%2").arg(QStandardPaths::writableLocation(QStandardPaths::HomeLocation)).arg(nameOfCopy);
    QFile::copy(newFilePath.append(".sqlite"),newFilePath);
}
