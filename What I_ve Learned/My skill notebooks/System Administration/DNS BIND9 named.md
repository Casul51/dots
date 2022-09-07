[https://bind9.readthedocs.io/en/v9\_16\_6/advanced.html#notify](https://bind9.readthedocs.io/en/v9_16_6/advanced.html#notify)

https://www.zytrax.com/books/dns/ch7/xfer.html

query - запрос, allow-query - сетка из которой DNS сервер будет принимать запросы

## dns notify - primary DNS server says to secondary DNS server that its DNS table changed and it need to update from him - update entire table

Dynamic update - somesort of DNS table upgrade on primary DNS
Upgraded version of this - transfer

## Incremental Zone Transfers (IXFR) - upgraded notify, updates only changed data on secondary server

**allow-transfer** **de**fines a [match list](https://www.zytrax.com/books/dns/ch7/address_match_list.html) e.g. IP **ad**dress(es) **th**at **ar**e **al**lowed to **tr**ansfer (**co**py) **th**e **zo**ne **in**formation **fr**om **th**e **se**rver (**ma**ster or **sl**ave **fo**r **th**e **zo**ne). **Th**e **de**fault **be**haviour is to **al**low **zo**ne **tr**ansfers to **an**y **ho**st. **Wh**ile on **it**s **fa**ce **th**is **ma**y **se**em an **ex**cessively **fr**iendly **de**fault, **DN**S **da**ta is **es**sentially **pu**blic (**th**at's **wh**y **it**s **th**ere) **an**d **th**e **ba**d **gu**ys **ca**n **ge**t **al**l of it **an**yway. **Ho**wever if **th**e **th**ought of **an**yone **be**ing **ab**le to **tr**ansfer **yo**ur **pr**ecious **zo**ne **fi**le is **re**pugnant, or (**an**d **th**is is **fa**r **mo**re **si**gnificant) **yo**u **ar**e **co**ncerned **ab**out **po**ssible **Do**S **at**tack **in**itiated by **XF**ER **re**quests, **th**en **us**e **th**e **fo**llowing **po**licy.

options {
....
// ban everyone by default
allow-transfer {"none";};
};
...
zone "example.com" in{
....
// explicity allow the slave(s) in each zone
allow-transfer {192.168.0.3;};
};

## dynamic DNS
or update dns records with another pc

http://www.btteknik.net/?p=143

$ ddns-confgen

thats all.