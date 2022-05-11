for pfx in *.pfx; do
	filename="$(basename "$pfx" .pfx)"
	mkdir $filename
	openssl pkcs12 -in "${filename}.pfx" -nocerts -out "${filename}/${filename}.key"
	openssl pkcs12 -in "${filename}.pfx" -clcerts -nokeys -out "${filename}/${filename}.crt"
	openssl rsa -in "${filename}/${filename}".key -out "${filename}/${filename}-decrypted.key" 
done
