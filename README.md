# Foodmanage

## 项目简介
Foodmanage 是一款智能的 iOS 冰箱食物管理应用，帮助用户追踪冰箱中的食材，管理保质期，并智能规划每周食谱。通过这款应用，用户可以避免食物浪费，更好地管理家庭饮食。

## 功能特点
- 冰箱食材管理
  - 记录食材数量、购买日期和保质期
  - 智能提醒即将过期的食材
  - 支持条形码扫描快速录入
- 菜谱管理
  - 创建和保存个人菜谱
  - 根据现有食材推荐菜谱
  - 支持自定义菜谱分类
- 食谱规划
  - 智能生成一周食谱
  - 根据营养需求调整食谱
  - 自动生成购物清单

## 技术栈
- SwiftUI - 现代化 iOS UI 框架
- CoreData - 本地数据存储
- CloudKit - 数据同步
- Vision Framework - 条形码扫描
- UserNotifications - 过期提醒

## 安装说明
```bash
# 从 App Store 下载安装
# 或通过 Xcode 构建运行
```

## 使用说明
1. 首次使用，扫描或手动添加冰箱中的食材
2. 设置食材的保质期，系统会自动提醒
3. 创建个人菜谱库
4. 使用食谱规划功能生成每周菜单
5. 根据生成的购物清单补充食材

## 项目结构
```
Foodmanage/
├── App/
│   ├── FoodmanageApp.swift
│   └── AppDelegate.swift
├── Models/
│   ├── Food.swift
│   ├── Recipe.swift
│   └── MealPlan.swift
├── Views/
│   ├── Fridge/
│   ├── Recipes/
│   └── MealPlanner/
├── Services/
│   ├── StorageService.swift
│   ├── NotificationService.swift
│   └── BarcodeScannerService.swift
└── Utils/
    ├── Extensions/
    └── Helpers/
```

## 贡献指南
1. Fork 项目
2. 创建特性分支
3. 提交更改
4. 发起 Pull Request

## 许可证
MIT License 