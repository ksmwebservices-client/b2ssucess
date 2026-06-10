# B2S Success Loan Application Portal

A web-based loan application system powered by Supabase.

## Features

* Loan application form
* Document upload support
* Secure file storage using Supabase Storage
* Admin dashboard access
* Responsive design
* Hosted on Vercel

## Technologies Used

* HTML
* JavaScript
* Supabase
* PostgreSQL
* Vercel

## Project Structure

```
.
├── index.html
├── config.js
├── logo.png
├── schema.sql
├── README.md
└── mnt/
```

## Supabase Setup

1. Create a Supabase project.
2. Execute `schema.sql` in SQL Editor.
3. Create a private bucket named:

```
loan-documents
```

4. Configure storage policies.
5. Copy:

* Project URL
* Publishable Key

6. Update `config.js`.

## Admin Login

Create an admin user from:

```
Authentication → Users → Add User
```

## Deployment

Deploy using Vercel:

https://vercel.com

Connect your GitHub repository and deploy.

## Database Tables

* loan_applications
* loan_documents

## Storage Bucket

```
loan-documents
```

## License

Private Project © B2S Success
