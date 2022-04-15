
#* @serializer contentType list(type="application/vnd.openxmlformats-officedocument.wordprocessingml.document")
#* @get /word
function(team){
  tmp <- tempfile()
  
  render("test_report.Rmd", tmp, output_format = "word_document",
         params = list(team = team))

  readBin(paste0(tmp, ".docx"), "raw", n=file.info(paste0(tmp, ".docx"))$size)
}

#* @serializer contentType list(type="text/html; charset=utf-8")
#* @get /html
function(team){
  tmp <- tempfile()
  
  render("test_report.Rmd", tmp, output_format = "html_document",
         params = list(team = team))
  
  readBin(paste0(tmp, ".html"), "raw", n=file.info(paste0(tmp, ".html"))$size)
}

#* @serializer contentType list(type="application/html")
#* @get /test
function(res){
  
  include_rmd("test.Rmd", res)
}
