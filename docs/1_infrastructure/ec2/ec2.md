Before creating instance, make sure it's in the right organization. I used [this](https://www.youtube.com/watch?v=noeLMJT1duw&t=373s) to help with my org setup.

```bash
   ,     #_
   ~\_  ####_        Amazon Linux 2023
  ~~  \_#####\
  ~~     \###|
  ~~       \#/ ___   https://aws.amazon.com/linux/amazon-linux-2023
   ~~       V~' '->
    ~~~         /
      ~~._.   _/
         _/ _/
       _/m/'
```

# CLI

Wanna activate your EC2 instance(s) without going through the console? [Here's](https://serverfault.com/questions/971990/how-to-find-out-an-ec2-instances-private-and-public-ip-via-aws-cli) a helpful guide!

## Start Instance

```bash
aws ec2 start-instances --instance-ids i-[identifier] --profile [profile]
```

## Stop Instance

```bash
aws ec2 stop-instances --instance-ids i-[identifier] --profile [profile]
```

## Describe Instance: IP

```bash
aws ec2 describe-instances --instance-ids i-[identifier] --query 'Reservations[*].Instances[*].[PublicIpAddress]' --profile [profile]
```
