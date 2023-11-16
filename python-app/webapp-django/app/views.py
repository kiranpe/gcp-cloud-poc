from django.http import HttpResponse
from django.template import loader

def mydetails(request):
  template = loader.get_template('myindex.html')
  return HttpResponse(template.render())