resource "aws_instance" "app_server"{
	ami = "ami-830c94e3"
	instance_type = "t2.micro"
	tags = {
		Name = "ExampleWebAppServer"
	}
}

resource "aws_iam_user" "user"{
	name = "brian"
	tags ={
		Description = "Intern with unnecessay priviledges"
	}
}

resource "aws_iam_policy" "adminAccess"{
	name = "adminAccess"
	policy = <<EOF
		{
			"Version" : "2012-10-17",
			"Statement": [
				{
					"Effect": "Allow",
					"Action": "*",
					"Resource": "*"
				}
			]
		}
		EOF
}

resource "aws_iam_user_policy_attachment" "user_admin"{
	user = aws_iam_user.user.name
	policy_arn = aws_iam_policy.adminAccess.arn
}
