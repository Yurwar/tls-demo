keytool -genkeypair \
        -keyalg RSA -keysize 2048 \
        -alias root-ca \
        -storetype PKCS12 \
        -dname "CN=Yurii Matora CA,OU=FICT,O=KPI,C=UA,L=Kyiv" \
        -ext BC:c=ca:true -ext KU=kCS \
        -validity 365 \
        -keystore ./root-ca/ca.p12 \
        -storepass psswrd \
        -keypass psswrd

keytool -exportcert \
        -keystore ./root-ca/ca.p12 \
        -storepass psswrd \
        -alias root-ca \
        -rfc -file ./root-ca/ca.pem

