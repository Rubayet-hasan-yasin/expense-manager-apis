import express from 'express';
import { body } from 'express-validator';
import {
  register,
  login,
  getProfile,
  updateProfile,
  googleCallback,
  googleFailure
} from '../controllers/authController.js';
import authMiddleware from '../middleware/auth.js';
import passport from '../config/passport.js';

const router = express.Router();

// Local authentication routes
router.post(
  '/register',
  [
    body('email').isEmail().withMessage('Valid email is required'),
    body('password').isLength({ min: 6 }).withMessage('Password must be at least 6 characters'),
    body('name').notEmpty().withMessage('Name is required')
  ],
  register
);

router.post(
  '/login',
  [
    body('email').isEmail().withMessage('Valid email is required'),
    body('password').notEmpty().withMessage('Password is required')
  ],
  login
);

// Google OAuth routes
router.get(
  '/google',
  (req, res, next) => {
    // If a redirectUrl is provided (e.g., from an Expo mobile app), encode it in the state
    const state = req.query.redirectUrl ? Buffer.from(req.query.redirectUrl).toString('base64') : undefined;
    
    // Dynamically build the callback URL using the actual host (e.g. 192.168.x.x) so Google redirects back to the phone correctly.
    const dynamicCallbackUrl = `${req.protocol}://${req.get('host')}/api/v1/auth/google/callback`;

    passport.authenticate('google', {
      scope: ['profile', 'email'],
      state: state,
      callbackURL: dynamicCallbackUrl
    })(req, res, next);
  }
);

router.get(
  '/google/callback',
  (req, res, next) => {
    // We must use the exact same dynamic callbackURL here as we did in the initial request
    const dynamicCallbackUrl = `${req.protocol}://${req.get('host')}/api/v1/auth/google/callback`;
    
    passport.authenticate('google', {
      failureRedirect: '/api/v1/auth/google/failure',
      session: false,
      callbackURL: dynamicCallbackUrl
    })(req, res, next);
  },
  googleCallback
);

router.get('/google/failure', googleFailure);

// Profile routes
router.get('/profile', authMiddleware, getProfile);

router.put(
  '/profile',
  authMiddleware,
  [
    body('email').optional().isEmail().withMessage('Valid email is required'),
    body('password')
      .optional()
      .isLength({ min: 6 })
      .withMessage('Password must be at least 6 characters'),
    body('name').optional().notEmpty().withMessage('Name cannot be empty')
  ],
  updateProfile
);

export default router;
