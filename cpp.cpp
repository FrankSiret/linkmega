#include "cpp.h"

cpp::cpp(QObject *parent) : QObject(parent)
{

}

bool cpp::test(QString s)
{
    if( s.contains("=") && (s.startsWith("https://") || s.startsWith("http://") )) {

        s = s.section("=",1);

        if(s.startsWith("https://") || s.startsWith("http://"))
            return true;

    }
    return false;
}

QString cpp::analize(QString x)
{
    QString s = x.section("=",1);
    return s;
}

QString cpp::getClipboard()
{
    return QGuiApplication::clipboard()->text();
}

void cpp::copy(QString x)
{
    QGuiApplication::clipboard()->setText(x);
}

cpp::~cpp() { }

void cpp::paste()
{
    emit text(QGuiApplication::clipboard()->text());
}
