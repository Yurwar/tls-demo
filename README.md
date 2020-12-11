# TLS demo configuration

### Project contains demo configuration for TLS with secure connection to Spring server

* For key stores with certificates generation Java keytool util was chosen

* As a cipher suite TLS_RSA_WITH_AES_128_CBC_SHA256 is used as it is located 
  in the middle of top preferred cipher suite list 
  
* For a cipher RSA 2048 is used as it is used by default 
  in OpenSSL, all popular browsers require RSA 2048 and also it is 
  average between performance and security
  
* TLSv1.3 was chosen as default for a server as it
  the newest one and is already a standard from 2018
  
* Key storage is PKCS12 as it is recommended by OWASP
  and replace JKS after Java 9
  
* Server certificates resides in PKCS12 key storage
  that is located in .tsl at user home directory
  
* To protect key storage and private keys their passwords
  is stored in environment variables
  
* Also, special access rules is used. Key storage available only for 
  read for user from which name server runs
  
