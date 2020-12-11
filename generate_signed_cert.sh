keytool -genkeypair \
        -keyalg RSA -keysize 2048 \
        -alias signed_localhost_cert \
        -storetype PKCS12 \
        -dname "CN=Yurii Matora self-signed cert,OU=FICT,O=KPI,C=UA,L=Kyiv" \
        -ext BC:c=ca:false -ext EKU:c=serverAuth \
        -ext "SAN:c=DNS:localhost,IP:127.0.0.1" \
        -validity 365 \
        -keystore ./server/server.p12 \
        -storepass psswrd \
        -keypass psswrd

keytool -certreq \
        -keystore ./server/server.p12 \
        -storepass psswrd \
        -alias signed_localhost_cert \
        -keypass psswrd \
        -file ./server/server.csr

keytool -gencert \
        -keystore ./root-ca/ca.p12 \
        -storepass psswrd \
        -infile ./server/server.csr \
        -alias root-ca \
        -keypass psswrd \
        -ext BC:c=ca:false \
        -ext EKU:c=serverAuth \
        -ext "SAN:c=DNS:localhost,IP:127.0.0.1" \
        -validity 365 \
        -rfc -outfile ./server/server.pem

keytool -importcert \
        -noprompt \
        -keystore ./server/server.p12 \
        -storepass psswrd \
        -alias root-ca \
        -keypass psswrd \
        -file ./root-ca/ca.pem

keytool -importcert \
        -noprompt \
        -keystore ./server/server.p12 \
        -storepass psswrd \
        -alias signed_localhost_cert \
        -keypass psswrd \
        -file ./server/server.pem