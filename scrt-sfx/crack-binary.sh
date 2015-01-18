#!/bin/sh

        cd $1
	cat SecureCRT  | od -A n -v -t x1 | tr -d ' \n' > SecureCRTHEX.txt
	mv SecureCRT SecureCRT_backup
	sed -i 's/6e533e406a45f0b6372f3ea10717000c7120127cd915cef8ed1a3f2c5b/785782391ad0b9169f17415dd35f002790175204e3aa65ea10cff20818/g' SecureCRTHEX.txt
	cat SecureCRTHEX.txt | xxd -r -p > SecureCRT
	
	
	cat SecureFX  | od -A n -v -t x1 | tr -d ' \n' > SecureFXHEX.txt
	mv SecureFX SecureFX_backup
	sed -i 's/c847abca184a6c5dfa47dc8efcd700019dc9df3743c640f50be307334fea/e02954a71cca592c855c91ecd4170001d6c606d38319cbb0deabebb05126/g' SecureFXHEX.txt
	cat SecureFXHEX.txt  | xxd -r -p > SecureFX
	
	rm SecureCRT_backup SecureCRTHEX.txt SecureFX_backup SecureFXHEX.txt