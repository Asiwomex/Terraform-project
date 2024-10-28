## Do this
when calling the module, you need to uncomment the s3 module also, and you need an ACM (Amazon Certificate Manager) ARN from us-east-1 also, this should be replaced with the placeholder in the dev/main.tf when calling the cloudfront module

### Example of a Correct ACM Certificate ARN Format:
```text
arn:aws:acm:us-east-1:123456789012:certificate/abcd1234-5678-90ab-cdef-1234567890ab
```

In this ARN:
- `us-east-1` is the region where the certificate is located.
- `123456789012` is the AWS account ID.
- `abcd1234-5678-90ab-cdef-1234567890ab` is the certificate ID.

### Fix:

Make sure you're using a valid ACM certificate ARN, particularly in the correct region (`us-east-1` is required for CloudFront SSL/TLS certificates). Update the `var.acm_certificate_arn` value in your Terraform configuration as follows:

1. **Check your ACM Certificate ARN:**
   - Ensure the ARN you are using is correct and matches your certificate in ACM. If your certificate is created in the wrong region, it will not work for CloudFront distributions.

2. **Update `dev/main.tf`:**
   Replace the placeholder value `arn:aws:acm:region:account-id:certificate/certificate-id` with your actual ACM certificate ARN, ensuring the region is `us-east-1`:
   ```hcl
   module "cloudfront" {
     source              = "../../modules/cloudfront"
     environment         = var.environment
     origin_domain_name  = module.s3.bucket_regional_domain_name
     acm_certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/abcd1234-5678-90ab-cdef-1234567890ab"  # Use your actual ARN here
     s3_bucket_name      = module.s3.bucket
     s3_bucket_arn       = module.s3.arn
   }
   ```

### How to Obtain the Correct ACM Certificate ARN:
1. Go to **AWS Certificate Manager (ACM)** in the AWS Management Console.
2. Ensure your certificate is in the **us-east-1** region (required for CloudFront).
3. Copy the ARN of the certificate.

### Recap:
- Ensure the ACM certificate ARN is valid.
- Ensure the certificate is in the `us-east-1` region.
- Replace the placeholder with your actual ACM certificate ARN in the `main.tf` file.

