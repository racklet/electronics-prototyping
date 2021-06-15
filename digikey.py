import os

import digikey
from digikey.v3.productinformation import KeywordSearchRequest

f_client_id = open("bin/digikey_client_id", "r")
f_client_secret = open("bin/digikey_client_secret", "r")

os.environ['DIGIKEY_CLIENT_ID'] = f_client_id.read()
os.environ['DIGIKEY_CLIENT_SECRET'] = f_client_secret.read()
os.environ['DIGIKEY_CLIENT_SANDBOX'] = 'True'
os.environ['DIGIKEY_STORAGE_PATH'] = 'bin'


# Query product number
dkpn = '296-6501-1-ND'
part = digikey.product_details(dkpn)
print(part.to_str())

# Search for parts 
search_request = KeywordSearchRequest(keywords='CRCW080510K0FKEA', record_count=10)
result = digikey.keyword_search(body=search_request)
print(result.to_str())
