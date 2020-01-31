#include "dbexporter.h"

DBExporter::DBExporter(QString offlineStoragePath, QObject *parent) : QObject(parent),
    m_offlineStoragePath(offlineStoragePath)
{

}

void DBExporter::exportDBtoLoc(QString nameOfCopy)
{
    QString newFilePath = QString("%1/%2").arg(QStandardPaths::displayName(QStandardPaths::HomeLocation)).arg(nameOfCopy);
    QFile::copy(m_offlineStoragePath.append(".sqlite"),newFilePath);
}
