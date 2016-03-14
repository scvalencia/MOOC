eimport csv
from datetime import datetime

enrollments = None
daily_engagement = None
project_submissions = None

def parse_maybe_int(i):
	return None if i == '' else int(i)

def parse_maybe_date(date):
	return None if date == '' else datetime.strptime(date, '%Y-%m-%d')

def get_data(debugging=False):

	global enrollments
	global daily_engagement
	global project_submissions

	with open('data/enrollments.csv', 'rb') as csvfile:
		reader = csv.DictReader(csvfile)
		enrollments = list(reader)

	with open('data/daily_engagement.csv', 'rb') as csvfile:
		reader = csv.DictReader(csvfile)
		daily_engagement = list(reader)

	with open('data/project_submissions.csv', 'rb') as csvfile:
		reader = csv.DictReader(csvfile)
		project_submissions = list(reader)

def clean_data(debugging=False):

	global enrollments
	global daily_engagement
	global project_submissions
	
	for enrollment in enrollments:
		enrollment['join_date'] = parse_maybe_date(enrollment['join_date'])
		enrollment['cancel_date'] = parse_maybe_date(enrollment['cancel_date'])
		enrollment['days_to_cancel'] = parse_maybe_int(enrollment['days_to_cancel'])
		enrollment['is_udacity'] = enrollment['is_udacity'] == 'True'
		enrollment['is_canceled'] = enrollment['is_canceled'] == 'True'

	for engagement_record in daily_engagement:
		engagement_record['utc_date'] = parse_maybe_date(engagement_record['utc_date'])
		engagement_record['num_courses_visited'] = int(float(engagement_record['num_courses_visited']))
		engagement_record['total_minutes_visited'] = float(engagement_record['total_minutes_visited'])
		engagement_record['lessons_completed'] = int(float(engagement_record['lessons_completed']))
		engagement_record['projects_completed'] =int(float(engagement_record['projects_completed']))
		engagement_record['account_key'] = engagement_record['acct']
		del engagement_record['acct']

	for submission in project_submissions:
		submission['creation_date'] = parse_maybe_date(submission['creation_date'])
		submission['completion_date'] = parse_maybe_date(submission['completion_date'])

	udacity_test_accounts = set()
	for enrollment in enrollments:
		if enrollment['is_udacity']:
			udacity_test_accounts.add(enrollment['account_key'])

	def remove_udacity_accounts(collection):

		non_udacity_data = []
		for item in collection:
			if item['account_key'] not in udacity_test_accounts:
				non_udacity_data.append(item)
		return non_udacity_data

	enrollments = remove_udacity_accounts(enrollments)
	daily_engagement = remove_udacity_accounts(daily_engagement)
	project_submissions = remove_udacity_accounts(project_submissions)

	if debugging:

		problematic_students = set()
		num_troubled_recods = 0

		for enrollment in enrollments:
			student = enrollment['account_key']
			if student not in get_unique_students(daily_engagement):
				problematic_students.add(student)

				if enrollment['join_date'] != enrollment['cancel_date']:
					num_troubled_recods += 1
				
		print len(problematic_students)
		print num_troubled_recods # Test accounts

def data_manager(debugging=False):
	
	get_data(debugging)
	clean_data(debugging)

def get_unique_students(collection):

	account_keys = [itm['account_key'] for itm in collection]
	return set(account_keys)

def main():

	data_manager(debugging=False)
	print len(enrollments)
	print len(daily_engagement)
	print len(project_submissions)

if __name__ == '__main__':
	main()