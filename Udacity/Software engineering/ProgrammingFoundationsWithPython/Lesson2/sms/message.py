from twilio.rest import TwilioRestClient

def get_credentials():
	file_object = open('acces.txt', 'r')
	account_sid, auth_token, message, phone_to, phone_from = tuple(i.strip() for i in file_object.readlines())
	return account_sid, auth_token, message, phone_to, phone_from

def send_sms(account_sid, auth_token, message, phone_to, phone_from):
 
	# Your Account Sid and Auth Token from twilio.com/user/account
	account_sid = account_sid
	auth_token  = auth_token

	client = TwilioRestClient(account_sid, auth_token)
	 
	message = client.messages.create(body=message,
	    to=phone_to,    # Replace with your phone number
	    from_=phone_from) # Replace with your Twilio number

	print 'Done'

def main():
	account_sid, auth_token, message, phone_to, phone_from = get_credentials()
	send_sms(account_sid, auth_token, message, phone_to, phone_from)

if __name__ == '__main__':
	main()