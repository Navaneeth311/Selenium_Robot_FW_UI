import json
import jsonpath

def read_locators(locator_name):
    f = open("../JsonFiles/Elements.json")
    response = json.load(f)
    value = jsonpath.jsonpath(response,locator_name)
    return value[0]
