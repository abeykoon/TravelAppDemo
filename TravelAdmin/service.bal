import ballerinax/salesforce;
import ballerina/http;
import TravelAdmin.config;

    @display {
        label: "Salesforce REST API Client",
        id: "salesforce-5b0da8e3-0d35-4373-86c3-230535a13feb"
    }
    salesforce:Client salesforceEp = check new (config = {
            baseUrl: config:salesforceBaseUrl,
            auth: {
                token: config:salesfouceToken
            }
        });


# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "TravelAdmin",
    id: "TravelAdmin-a4a4a2c1-9829-4461-b9fd-f4f68e9046b9"
}
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
