# This is a python function that is called by the API
# the function name is get_profile.
# we are getting a passed user's name and using the linkedin api to get their profile
# we are then returning the profile as a json object
# we need to get the following information from the profile:
# ['id', 'first-name', 'last-name', 'email-address', 'headline', 'location', 'industry', 'summary', 'specialties', 'positions', 'picture-url', 'public-profile-url', 'date-of-birth', 'last-modified-timestamp']

# import the linkedin api
from linkedin import linkedin
import os

# this is to keep the keys secret
api_key = os.environ['LINKEDIN_API_KEY']
api_secret = os.environ['LINKEDIN_API_SECRET']

# create an authentication object
authentication = linkedin.LinkedInAuthentication(api_key, api_secret, 'http://localhost:5000', ['r_basicprofile'])
# create an application object
application = linkedin.LinkedInApplication(authentication)

# crete a function called get_profile
def get_profile(user_name):
    # this is a json object
    profile = application.get_profile(selectors=['id', 'first-name', 'last-name', 'email-address', 'headline', 
                                                    'location', 'industry', 'summary', 'specialties', 'positions', 
                                                    'picture-url', 'public-profile-url', 'date-of-birth', 'last-modified-timestamp'])

    # return the profile as a json object
    return (profile)