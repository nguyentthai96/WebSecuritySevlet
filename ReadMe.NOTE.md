 #Config Tomcat with SSL

   https://tomcat.apache.org/tomcat-8.0-doc/ssl-howto.html
 
   <!-- NTT config SSL/TLS -->
    <Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"
                  maxThreads="150" SSLEnabled="true">
        <SSLHostConfig>
           <Certificate certificateKeystoreFile="conf/localhost-rsa.jks"
                        type="RSA" />
        </SSLHostConfig>
    </Connector>
    
    
openssl pkcs12 -export -in mycert.crt -inkey mykey.key -out mycert.p12 -name tomcat -CAfile myCA.crt -caname root -chain

keytool -genkey -alias admin -keyalg RSA -keystore D:\localhost-key
keytool -genkey -keyalg RSA -alias selfsigned -keystore keystore.jks -storepass changeit -validity 360 -keysize 2048
keytool -genkey -alias myapp -keystore D:\localhost-rsa-key.pem -keyalg RSA
keytool -genkey -alias myapp -keystore D:\localhost-rsa-key.cert -keyalg RSA
keytool -genkeypair -alias myapp -keystore D:\localhost-key.cert -keyalg RSA
keytool -importkeystore -srckeystore D:\localhost-rsa-key.pem -destkeystore D:\localhost-rsa-key.pem -deststoretype pkcs12
keytool -genkeypair -alias mykey -keyalg RSA -keystore mykey.cert
keytool -genkey -alias nguyentthai96 -keyalg RSA -keystore mykey.cert
keytool -genkey -noprompt -alias tomcat-localhost -keyalg RSA -keystore localhost-rsa.jks -keypass 123456 -storepass 123456 -dname "CN=tomcat-cert, OU=Dev, O=Logicbig, L=Dallas, ST=TX, C=US"

///////////////////////////////////////////////
https://www.youtube.com/watch?v=d-f-2pMOgOA
<Connector port="443" protocol="org.apache.coyote.http11.Http11NioProtocol"
               maxThreads="150" SSLEnabled="true" scheme="https" secure="true"
               defaultSSLHostConfigName="abcde.xyz-informatik.de">
        <SSLHostConfig hostName="abcde.xyz-informatik.de">
        <Certificate certificateFile="conf/ssl/abcde.xyz-informatik.de/domain.crt"
                     certificateChainFile="conf/ssl/abcde.xyz-informatik.de/chain.crt"
                     certificateKeyFile="conf/ssl/abcde.xyz-informatik.de/domain.key"
                     certificateKeyPassword=""
                     certificateKeyAlias=""
                     type="RSA" />
</Connector>
certificateKeystorePassword
https://stackoverflow.com/questions/49338188/setting-property-keystorepass-to-did-not-find-a-matching-property
https://stackoverflow.com/questions/16891182/keytool-error-keystore-was-tampered-with-or-password-was-incorrect
keytool -genkey -alias tomcat -keyalg RSA -keystore D:\tomcatkeystore 
changeit

https://stackoverflow.com/questions/8169999/how-can-i-create-a-self-signed-cert-for-localhost
https://www.youtube.com/watch?v=8sHeP4RR3tc