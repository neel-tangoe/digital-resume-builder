// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

//= require jquery
//= require jquery_ujs

$(document).on("keyup", "#resume_name", function(){
	var resume_name = $(this).val();
  $(".resume_name").text(resume_name);
});

$(document).on("keyup", "#resume_email", function(){
	var resume_email = $(this).val();
  $(".resume_email").text(resume_email);
});

$(document).on("keyup", "#resume_address", function(){
	var resume_address = $(this).val();
  $(".resume_address").text(resume_address);
});


$(document).on("keyup", "#resume_general_info", function(){
	var resume_general_info = $(this).val();
  $(".resume_general_info").text(resume_general_info);
});

$(document).on("keyup", "#resume_interests", function(){
	var resume_interests = $(this).val();
  $(".resume_interests").text(resume_interests);
});

$(document).on("change", "#resume_gender", function(){
	var resume_gender = $(this).val();
  $(".resume_gender").text(resume_gender);
});

$(document).on("keyup", "#resume_country", function(){
	var resume_country = $(this).val();
  $(".resume_country").text(resume_country);
});

$(document).on("keyup", "#resume_phone_number", function(){
	var resume_phone_number = $(this).val();
  $(".resume_phone_number").text(resume_phone_number);
});

$(document).on("change", "#resume_birthdate", function(){
	var resume_birthdate = $(this).val();
  $(".resume_birthdate").text(resume_birthdate);
});

$(document).on("keyup", "#resume_website", function(){
	var resume_website = $(this).val();
  $(".resume_website").text(resume_website);
});

$(document).on("keyup", "#resume_skills_attributes_0_percent", function(){
	var resume_skills_attributes_0_percent = $(this).val();
  $(".resume_skills_attributes_0_percent").text(resume_skills_attributes_0_percent);
});

$(document).on("keyup", "#resume_skills_attributes_0_title", function(){
	var resume_skills_attributes_0_title = $(this).val();
  $(".resume_skills_attributes_0_title").text(resume_skills_attributes_0_title);
});