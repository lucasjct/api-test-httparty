require 'spec_helper'

def token(field_email = '', field_password = '')

        @body = {
            session: {
                email: field_email,
                password: field_password
            }
        }.to_json

        @login = Login.post('/sessions', body:@body)
        $token = @login.parsed_response['data']['attributes']['auth-token']

     return $token
end