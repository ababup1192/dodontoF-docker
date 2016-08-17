From ababup1192/httpd-ruby:latest
MAINTAINER ababup1192

# httpdの設定
# RUN sed -i -e 's_DocumentRoot "/usr/local/apache2/htdocs"_DocumentRoot "/var/www/html"_' /usr/local/apache2/conf/httpd.conf \
# && sed -i -e "s/<IfModule mime_module>/<IfModule mime_module>\n\tAddHandler cgi-script .cgi .rb\n\tAddHandler application\/x-shockwave-flash .swf/" /usr/local/apache2/conf/httpd.conf \
# && echo \<Directory "/var/www/html/DodontoF/"\> >> /usr/local/apache2/conf/httpd.conf \
# && echo Options FollowSymLinks ExecCGI >> /usr/local/apache2/conf/httpd.conf \
# && echo Require all granted >> /usr/local/apache2/conf/httpd.conf \
# && echo Order deny,allow >> /usr/local/apache2/conf/httpd.conf \
# && echo Deny from all >> /usr/local/apache2/conf/httpd.conf \
# && echo AddHandler cgi-script .rb .pl >> /usr/local/apache2/conf/httpd.conf \
# && echo AddHandler application/x-shockwave-flash .swf >> /usr/local/apache2/conf/httpd.conf \
# && echo DirectoryIndex DodontoF.swf >> /usr/local/apache2/conf/httpd.conf \
# && echo \</Directory\> >> /usr/local/apache2/conf/httpd.conf

ENV DDNTF_Ver DodontoF_Ver.1.48.00_sugar_chocolate_waffle

# どどんとふのインストール
RUN mkdir /dodontof \
&& cd /dodontof \
&& curl -fSL -o dodontof.zip "https://www.dropbox.com/s/hd26rf4pkbi1oci/$DDNTF_Ver.zip?dl=1" \
&& unzip dodontof.zip \
&& cd DodontoF_WebSet \
&& mv public_html/* /usr/local/apache2/htdocs/ \
&& mv saveData /usr/local/apache2/ \
# && mv public_html/imageUploadSpace /var/www/html \
# && mv saveData /var/www \
&& cd /usr/local/apache2 \
# && chown -Rf www-data:www-data saveData/ \
# && chown -Rf www-data:www-data htdocs/* \
# && chcon -R -t httpd_sys_content_t public_html/ saveData/ \
# && chown -Rf www-data:www-data html \
# && chown -Rf www-data:www-data saveData \
&& chmod 777 -R /usr/local/apache2/htdocs/DodontoF \
&& chmod 777 -R /usr/local/apache2/htdocs/DodontoF/DodontoFServer.rb \
&& chmod 777 -R /usr/local/apache2/htdocs/DodontoF/log.txt \
&& chmod 777 -R /usr/local/apache2/htdocs/DodontoF/log.txt.0 \
&& chmod 777 -R /usr/local/apache2/htdocs/DodontoF/saveDataTempSpace \
&& chmod 777 -R /usr/local/apache2/htdocs/DodontoF/fileUploadSpace \
&& chmod 777 -R /usr/local/apache2/htdocs/DodontoF/replayDataUploadSpace \
&& chmod 777 -R /usr/local/apache2/htdocs/imageUploadSpace \
&& chmod 777 -R /usr/local/apache2/htdocs/imageUploadSpace/smallImages \
&& chmod 777 -R /usr/local/apache2/saveData \
&& rm -rf /dodontof

