module.exports = {
  PORT: process.env.PORT || 8000,
  NODE_ENV: process.env.NODE_ENV || 'development',
  DATABASE_URL: process.env.DATABASE_URL || 'postgresql://brtr@localhost/skillswap',
  API_TOKEN: process.env.API_TOKEN,
  JWT_EXPIRY: process.env.JWT_EXPIRY || '120m'
};