import 'package:ai_expense/ui/core/themes/app_colors.dart';
import 'package:ai_expense/utils/utils.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const headerHeight = 150.0;
    const profileCardHeight = 200.0;
    const profileCardOverlap = 60.0;
    final headerSectionHeight = headerHeight - profileCardOverlap + profileCardHeight - 50;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: ScrollConfiguration(
        behavior: const NoStretchScrollBehavior(),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              toolbarHeight: kToolbarHeight,
              elevation: 0,
              scrolledUnderElevation: 0,
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.white,
              titleSpacing: 20,
              title: const Text(
                'Cá nhân',
                style: TextStyle(
                  color: Color(0xFF101828),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: headerSectionHeight,
                child: Stack(
                  children: [
                    _buildProfileHeader(height: headerHeight),
                    _buildProfileInfoCard(),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'TÀI KHOẢN',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.6,
                        color: Color(0xFF98A2B3),
                      ),
                    ),

                    const SizedBox(height: 10),

                    _buildAccountOptionsCard(
                      [
                        _buildProfileOptionItem(
                          icon: Icons.edit_outlined,
                          iconColor: const Color(0xFF3B82F6),
                          iconBackground: const Color(0xFFE9F2FF),
                          title: 'Chỉnh sửa hồ sơ',
                          subtitle: 'Nguyễn Văn A',
                          onTap: () {},
                        ),
                        const Divider(height: 1, thickness: 1, color: Color(0xFFECEFF3)),
                        _buildProfileOptionItem(
                          icon: Icons.key_outlined,
                          iconColor: const Color(0xFFFF8A00),
                          iconBackground: const Color(0xFFFFF3E6),
                          title: 'Đổi mật khẩu',
                          subtitle: 'Cập nhật lần cuối: 3 tháng trước',
                          onTap: () {},
                        ),
                        const Divider(height: 1, thickness: 1, color: Color(0xFFECEFF3)),
                        _buildProfileOptionItem(
                          icon: Icons.account_balance_wallet_outlined,
                          iconColor: const Color(0xFF16A34A),
                          iconBackground: const Color(0xFFE8F7EE),
                          title: 'Ngân sách tháng',
                          subtitle: '5,000,000 VNĐ / tháng',
                          onTap: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      'ỨNG DỤNG',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.6,
                        color: Color(0xFF98A2B3),
                      ),
                    ),

                    const SizedBox(height: 10),

                    _buildAccountOptionsCard(
                      [
                        _buildProfileOptionItem(
                          icon: Icons.edit_outlined,
                          iconColor: const Color(0xFF3B82F6),
                          iconBackground: const Color(0xFFE9F2FF),
                          title: 'Thông báo',
                          subtitle: 'Bật tắt thông báo ứng dụng',
                          onTap: () {},
                        ),
                        const Divider(height: 1, thickness: 1, color: Color(0xFFECEFF3)),
                        _buildProfileOptionItem(
                          icon: Icons.key_outlined,
                          iconColor: const Color(0xFFFF8A00),
                          iconBackground: const Color(0xFFFFF3E6),
                          title: 'Thông báo email',
                          subtitle: 'Gửi báo cáo chi tiêu hàng tuần',
                          onTap: () {},
                        ),
                        const Divider(height: 1, thickness: 1, color: Color(0xFFECEFF3)),
                        _buildProfileOptionItem(
                          icon: Icons.account_balance_wallet_outlined,
                          iconColor: const Color(0xFF16A34A),
                          iconBackground: const Color(0xFFE8F7EE),
                          title: 'Cảnh báo ngân sách',
                          subtitle: 'Khi chi tiêu vượt 80% ngân sách',
                          onTap: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      'BẢO MẬT',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.6,
                        color: Color(0xFF98A2B3),
                      ),
                    ),

                    const SizedBox(height: 10),

                    _buildAccountOptionsCard(
                      [
                        _buildProfileOptionItem(
                          icon: Icons.edit_outlined,
                          iconColor: const Color(0xFF3B82F6),
                          iconBackground: const Color(0xFFE9F2FF),
                          title: 'Face ID / Touch ID',
                          subtitle: 'Đăng nhập nhanh bằng sinh trắc học',
                          onTap: () {},
                        ),
                        const Divider(height: 1, thickness: 1, color: Color(0xFFECEFF3)),
                        _buildProfileOptionItem(
                          icon: Icons.account_balance_wallet_outlined,
                          iconColor: const Color(0xFF16A34A),
                          iconBackground: const Color(0xFFE8F7EE),
                          title: 'Mã PIN',
                          subtitle: 'Thiết lập mã PIN để bảo vệ tài khoản',
                          onTap: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    _buildAccountOptionsCard(
                      [
                        _buildProfileOptionItem(
                          icon: Icons.edit_outlined,
                          iconColor: const Color(0xFF3B82F6),
                          iconBackground: const Color(0xFFE9F2FF),
                          title: 'Đăng xuất',
                          subtitle: 'Đăng xuất khỏi tài khoản',
                          onTap: () {},
                        ),
                      ],
                    ),                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader({required double height}) {
    final gradientColors = [AppColors.gradientColorStart, AppColors.gradientColorEnd];

    return ClipRRect(
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          // gradient: LinearGradient(
          //   colors: gradientColors,
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),
        ),
      ),
    );
  }

  Widget _buildProfileInfoCard() {
    return Center(
      child: Container(
        width: 400,
        height: 200,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Color(0xFFE9F2FF),
                  child: Icon(
                    Icons.person,
                    color: Color(0xFF3B82F6),
                    size: 30,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nguyen Van A',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF101828),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'namnguyen147159@gmail.com',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF667085),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '0868 244 006',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF667085),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),

            const Divider(height: 5, color: AppColors.dividerColor),

            const SizedBox(height: 16),
            
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatisticItem(
                    value: '3.45M',
                    label: 'Tháng này',
                    valueColor: const Color(0xFFFF3B30),
                  ),
                  const VerticalDivider(width: 5, color: AppColors.dividerColor),
                  _buildStatisticItem(
                    value: '5M',
                    label: 'Ngân sách',
                    valueColor: const Color(0xFF3B82F6),
                  ),
                  const VerticalDivider(width: 5, color: AppColors.dividerColor),
                  _buildStatisticItem(
                    value: '47',
                    label: 'Giao dịch',
                    valueColor: const Color(0xFF8B5CF6),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget _buildStatisticItem({
    required String value,
    required String label,
    required Color valueColor,
  }) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: valueColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFF667085),
          ),
        ),
      ],
    );
  }

  Widget _buildAccountOptionsCard(List<Widget> children) {
    final borderRadius = BorderRadius.circular(14);

    return Material(
      color: Colors.white,
      borderRadius: borderRadius,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(color: const Color(0xFFDDE1E6)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: children
        ),
      ),
    );
  }

  Widget _buildProfileOptionItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBackground,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Icon(icon, color: iconColor, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF101828),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF98A2B3),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.chevron_right,
              color: Color(0xFFBCC2CD),
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}