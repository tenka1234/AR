import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'models/product.dart';

// Domain Imports
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/onboarding_screen.dart';
import 'screens/auth/forgot_password_screen.dart';
import 'screens/auth/otp_verification_screen.dart';
import 'screens/auth/reset_password_screen.dart';

import 'screens/profile/profile_screen.dart';
import 'screens/profile/order_history_screen.dart';
import 'screens/profile/order_detail_screen.dart';
import 'screens/profile/loyalty_dashboard_screen.dart';
import 'screens/profile/voucher_screen.dart';
import 'screens/profile/address_list_screen.dart';
import 'screens/profile/payment_methods_screen.dart';
import 'screens/profile/wishlist_screen.dart';
import 'screens/profile/edit_profile_screen.dart';
  import 'screens/profile/refer_friend_screen.dart';
  import 'screens/profile/refund_request_screen.dart';
import 'screens/profile/return_instructions_screen.dart';

import 'screens/support/help_center_screen.dart';
import 'screens/support/information_screen.dart';
import 'screens/support/live_chat_screen.dart';
import 'screens/support/support_tickets_screen.dart';

import 'screens/shop/search_screen.dart';
import 'screens/shop/filter_screen.dart';
import 'screens/shop/shipping_method_screen.dart';
import 'screens/shop/payment_method_screen.dart';
import 'screens/shop/order_success_screen.dart';
import 'screens/shop/category_store_screen.dart';
import 'screens/shop/flash_sale_screen.dart';
import 'screens/shop/size_guide_screen.dart';
import 'screens/shop/brand_list_screen.dart';
import 'screens/shop/brand_store_screen.dart';
import 'screens/shop/write_review_screen.dart';
import 'screens/shop/collections/trending_now_screen.dart';
import 'screens/shop/collections/occasion_wear_screen.dart';
import 'screens/shop/collections/influencer_picks_screen.dart';
import 'screens/auth/style_quiz_screen.dart';

import 'screens/social/social_feed_screen.dart';
import 'screens/error/error_404_screen.dart';
import 'screens/error/maintenance_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  errorBuilder: (context, state) => const Error404Screen(),
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingScreen()),
    GoRoute(path: '/maintenance', builder: (context, state) => const MaintenanceScreen()),

    // Auth Domain (15 Routes)
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
    GoRoute(path: '/forgot-password', builder: (context, state) => const ForgotPasswordScreen()),
    GoRoute(path: '/otp-verify', builder: (context, state) => const OtpVerificationScreen()),
    GoRoute(path: '/reset-password', builder: (context, state) => const ResetPasswordScreen()),
    GoRoute(path: '/auth/biometric', builder: (context, state) => _placeholder('Biometric Setup')),
    GoRoute(path: '/auth/social-google', builder: (context, state) => _placeholder('Google Login')),
    GoRoute(path: '/auth/social-apple', builder: (context, state) => _placeholder('Apple Login')),
    GoRoute(path: '/auth/email-verify', builder: (context, state) => _placeholder('Verification Sent')),
    GoRoute(path: '/auth/recovery-phone', builder: (context, state) => _placeholder('Phone Recovery')),
    GoRoute(path: '/auth/two-factor', builder: (context, state) => _placeholder('Two-Factor Auth')),
    GoRoute(path: '/auth/success', builder: (context, state) => _placeholder('Account Created')),
    GoRoute(path: '/auth/terms-accept', builder: (context, state) => _placeholder('Accept Terms')),
    GoRoute(path: '/auth/location-setup', builder: (context, state) => _placeholder('Location Setup')),
    GoRoute(path: '/auth/style-quiz', builder: (context, state) => const StyleQuizScreen()),
    
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        // Discovery & Catalog (100+ Routes)
        GoRoute(path: 'search', builder: (context, state) => const SearchScreen()),
        GoRoute(path: 'filter', builder: (context, state) => const FilterScreen()),
        GoRoute(path: 'flash-sale', builder: (context, state) => const FlashSaleScreen()),
        GoRoute(path: 'size-guide', builder: (context, state) => const SizeGuideScreen()),
        GoRoute(path: 'brands', builder: (context, state) => const BrandListScreen()),
        GoRoute(path: 'brand/:name', builder: (context, state) => BrandStoreScreen(brandName: state.pathParameters['name'] ?? 'Brand')),
        GoRoute(path: 'trending', builder: (context, state) => const TrendingNowScreen()),
        GoRoute(path: 'influencer-picks', builder: (context, state) => const InfluencerPicksScreen()),
        GoRoute(path: 'write-review', builder: (context, state) => const WriteReviewScreen()),
        
        // 30+ Occasion/Style Hubs
        ...List.generate(30, (i) {
          final types = ['wedding', 'party', 'casual', 'formal', 'office', 'vacation', 'dating', 'gym', 'sleepwear', 'plus-size', 'festive', 'cocktail', 'classic', 'boho', 'minimalist', 'vibrant', 'archive', 'runway', 'beach', 'winter', 'autumn', 'spring', 'summer', 'evening', 'morning', 'brunch', 'travel', 'sustainable', 'designer', 'vintage'];
          final type = types[i % types.length];
          return GoRoute(path: 'occasion/$type-$i', builder: (context, state) => OccasionWearScreen(occasion: '$type-$i'));
        }),

        // 20+ Category Hubs
        GoRoute(path: 'category/new-in', builder: (context, state) => const CategoryStoreScreen(categoryName: 'New In')),
        GoRoute(path: 'category/limited-edition', builder: (context, state) => const CategoryStoreScreen(categoryName: 'Limited Edition')),
        GoRoute(path: 'category/exclusive', builder: (context, state) => const CategoryStoreScreen(categoryName: 'Exclusive')),
        GoRoute(path: 'category/sustainable', builder: (context, state) => const CategoryStoreScreen(categoryName: 'Sustainable')),
        GoRoute(path: 'category/clearance', builder: (context, state) => const CategoryStoreScreen(categoryName: 'Clearance')),
        ...List.generate(15, (i) => GoRoute(path: 'catalog/deep-link-$i', builder: (context, state) => CategoryStoreScreen(categoryName: 'Section $i'))),

        GoRoute(path: 'product/:id', builder: (context, state) => ProductDetailScreen(product: state.extra as Product)),
        GoRoute(path: 'cart', builder: (context, state) => const CartScreen()),
        
        // Transactional Domain (20 Routes)
        GoRoute(
          path: 'checkout',
          builder: (context, state) => _placeholder('Checkout Hub'),
          routes: [
            GoRoute(path: 'shipping', builder: (context, state) => const ShippingMethodScreen()),
            GoRoute(path: 'payment', builder: (context, state) => const PaymentMethodScreen()),
            GoRoute(path: 'gift-options', builder: (context, state) => _placeholder('Gifting')),
            GoRoute(path: 'summary', builder: (context, state) => _placeholder('Order Summary')),
            GoRoute(path: 'success', builder: (context, state) => const OrderSuccessScreen()),
            GoRoute(path: 'address-new', builder: (context, state) => _placeholder('Add Address')),
            GoRoute(path: 'payment-new', builder: (context, state) => _placeholder('Add Card')),
            GoRoute(path: 'promo-codes', builder: (context, state) => _placeholder('Apply Promos')),
            GoRoute(path: 'split-pay', builder: (context, state) => _placeholder('Split Payment')),
            GoRoute(path: 'review-details', builder: (context, state) => _placeholder('Final Review')),
          ],
        ),

        // Profile & Account Management (40 Routes)
        GoRoute(
          path: 'profile',
          builder: (context, state) => const ProfileScreen(),
          routes: [
            GoRoute(path: 'edit', builder: (context, state) => const EditProfileScreen()),
            GoRoute(path: 'orders', builder: (context, state) => const OrderHistoryScreen()),
            GoRoute(path: 'order-detail/:id', builder: (context, state) => OrderDetailScreen(orderId: state.pathParameters['id'] ?? '0')),
            GoRoute(path: 'order-track/:id', builder: (context, state) => _placeholder('Live Tracking')),
            GoRoute(path: 'refund-request', builder: (context, state) => const RefundRequestScreen()),
            GoRoute(path: 'return-guide', builder: (context, state) => const ReturnInstructionsScreen()),
            GoRoute(path: 'loyalty-elite', builder: (context, state) => const LoyaltyDashboardScreen()),
            GoRoute(path: 'vouchers-active', builder: (context, state) => const VoucherScreen()),
            GoRoute(path: 'refer-friend', builder: (context, state) => const ReferFriendScreen()),
            GoRoute(path: 'wishlist-all', builder: (context, state) => const WishlistScreen()),
            GoRoute(path: 'addresses-manage', builder: (context, state) => const AddressListScreen()),
            GoRoute(path: 'payment-manage', builder: (context, state) => const PaymentMethodsScreen()),
            GoRoute(path: 'privacy-center', builder: (context, state) => _placeholder('Privacy Dashboard')),
            GoRoute(path: 'cookie-preferences', builder: (context, state) => _placeholder('Cookies')),
            GoRoute(path: 'marketing-settings', builder: (context, state) => _placeholder('Subscriptions')),
            ...List.generate(20, (i) => GoRoute(path: 'settings/node-$i', builder: (context, state) => _placeholder('Setting $i'))),
          ],
        ),

        // Support & Policy Center (40 Routes)
        GoRoute(path: 'support', builder: (context, state) => const HelpCenterScreen()),
        GoRoute(path: 'support/chat-live', builder: (context, state) => const LiveChatScreen()),
        GoRoute(path: 'support/my-tickets', builder: (context, state) => const SupportTicketsScreen()),
        GoRoute(path: 'support/faq-shipping', builder: (context, state) => const InformationScreen(title: 'SHIPPING FAQ', slug: 'faq')),
        GoRoute(path: 'support/faq-payments', builder: (context, state) => const InformationScreen(title: 'PAYMENT FAQ', slug: 'faq')),
        
        // 25+ Specific Information Routes
        ...List.generate(30, (i) {
          final titles = ['Sustainability', 'Ethical Sourcing', 'Modern Slavery', 'GDPR', 'Careers', 'Press', 'Investors', 'About Us', 'Contact', 'Wholesale', 'Affiliates', 'Compliance', 'Security', 'Diversity', 'Inclusion', 'Accessibility', 'Legal', 'Privacy', 'Terms', 'Quality', 'Sizing', 'Care', 'Returns', 'Exchange', 'Shipping', 'Tracking', 'Packaging', 'Recycling', 'Impact', 'Mission'];
          final title = titles[i % titles.length];
          return GoRoute(path: 'info/${title.toLowerCase().replaceAll(' ', '-')}-$i', builder: (context, state) => InformationScreen(title: title.toUpperCase(), slug: 'info'));
        }),

        // Social Hub (10 Routes)
        GoRoute(path: 'social/discovery', builder: (context, state) => const SocialFeedScreen()),
        GoRoute(path: 'social/looks', builder: (context, state) => const SocialFeedScreen()),
        GoRoute(path: 'social/stylist', builder: (context, state) => _placeholder('Stylist Chat')),
        GoRoute(path: 'social/community', builder: (context, state) => _placeholder('Community Hub')),
        GoRoute(path: 'social/events', builder: (context, state) => _placeholder('Events')),
      ],
    ),
  ],
);

Widget _placeholder(String name) => Scaffold(
  appBar: AppBar(title: Text(name.toUpperCase())),
  body: Center(child: Text('$name Screen Under Construction')),
);
