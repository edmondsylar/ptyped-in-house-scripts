from linkedin import linkedin


class LinkedIn_Profiler:
    def __init__(self):
        # Create a LinkedIn application instance using your app credentials
        self.application = linkedin.LinkedInApplication(
            auth=linkedin.LinkedInAuthentication(
                # replace with your app credentials
                'client_id',
                'client_secret',
                'redirect_uri',
                ['r_liteprofile', 'r_emailaddress']
            )
        )
        
    def get_access_token(self):
        # get the access token
        access_token = self.application.authentication.get_access_token()
        # return the access token
        return access_token
        
    def get_profile(self, user_name):
        # this is a json object
        profile = self.application.get_profile(selectors=[
            'id', 'first-name', 'last-name', 'email-address', 'headline', 
            'location', 'industry', 'summary', 'specialties', 'positions', 
            'picture-url', 'public-profile-url', 'date-of-birth', 'last-modified-timestamp'
        ])
        
        # return the profile as a json object
        return profile
