Return-Path: <SRS0=v7GQ=KX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A53C47087
	for <intel-gfx@archiver.kernel.org>; Fri, 28 May 2021 10:23:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1A2A6135F
	for <intel-gfx@archiver.kernel.org>; Fri, 28 May 2021 10:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1A2A6135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4954B6EB53;
	Fri, 28 May 2021 10:23:14 +0000 (UTC)
X-Greylist: delayed 1139 seconds by postgrey-1.36 at gabe;
 Fri, 28 May 2021 10:23:12 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D3F6F493
 for <intel-gfx@lists.freedesktop.org>; Fri, 28 May 2021 10:23:12 +0000 (UTC)
Received: from dggeml765-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fs0Zc0dSWzYr67;
 Fri, 28 May 2021 18:01:28 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggeml765-chm.china.huawei.com (10.1.199.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 28 May 2021 18:04:08 +0800
Received: from localhost (10.174.179.215) by dggema769-chm.china.huawei.com
 (10.1.198.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 28
 May 2021 18:04:08 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <chris@chris-wilson.co.uk>, <tvrtko.ursulin@intel.com>
Date: Fri, 28 May 2021 18:04:03 +0800
Message-ID: <20210528100403.21548-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected
Subject: [Intel-gfx] [PATCH -next] drm/i915: use DEVICE_ATTR_RO macro
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Use DEVICE_ATTR_RO() helper instead of plain DEVICE_ATTR(),
which makes the code a bit shorter and easier to read.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/i915/i915_pmu.c   |  8 +++-----
 drivers/gpu/drm/i915/i915_sysfs.c | 30 +++++++++++++++---------------
 2 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 41651ac255fa..fb215929b05b 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -834,15 +834,13 @@ static ssize_t i915_pmu_event_show(struct device *dev,
 	return sprintf(buf, "config=0x%lx\n", eattr->val);
 }
 
-static ssize_t
-i915_pmu_get_attr_cpumask(struct device *dev,
-			  struct device_attribute *attr,
-			  char *buf)
+static ssize_t cpumask_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
 {
 	return cpumap_print_to_pagebuf(true, buf, &i915_pmu_cpumask);
 }
 
-static DEVICE_ATTR(cpumask, 0444, i915_pmu_get_attr_cpumask, NULL);
+static DEVICE_ATTR_RO(cpumask);
 
 static struct attribute *i915_cpumask_attrs[] = {
 	&dev_attr_cpumask.attr,
diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index 4c6b5d52b5ca..183517d1a73d 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -58,8 +58,8 @@ static u32 calc_residency(struct drm_i915_private *dev_priv,
 	return DIV_ROUND_CLOSEST_ULL(res, 1000);
 }
 
-static ssize_t
-show_rc6_mask(struct device *kdev, struct device_attribute *attr, char *buf)
+static ssize_t rc6_enable_show(struct device *kdev,
+			       struct device_attribute *attr, char *buf)
 {
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
 	unsigned int mask;
@@ -75,43 +75,43 @@ show_rc6_mask(struct device *kdev, struct device_attribute *attr, char *buf)
 	return sysfs_emit(buf, "%x\n", mask);
 }
 
-static ssize_t
-show_rc6_ms(struct device *kdev, struct device_attribute *attr, char *buf)
+static ssize_t rc6_residency_ms_show(struct device *kdev,
+				     struct device_attribute *attr, char *buf)
 {
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
 	u32 rc6_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6);
 	return sysfs_emit(buf, "%u\n", rc6_residency);
 }
 
-static ssize_t
-show_rc6p_ms(struct device *kdev, struct device_attribute *attr, char *buf)
+static ssize_t rc6p_residency_ms_show(struct device *kdev,
+				      struct device_attribute *attr, char *buf)
 {
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
 	u32 rc6p_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6p);
 	return sysfs_emit(buf, "%u\n", rc6p_residency);
 }
 
-static ssize_t
-show_rc6pp_ms(struct device *kdev, struct device_attribute *attr, char *buf)
+static ssize_t rc6pp_residency_ms_show(struct device *kdev,
+				       struct device_attribute *attr, char *buf)
 {
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
 	u32 rc6pp_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6pp);
 	return sysfs_emit(buf, "%u\n", rc6pp_residency);
 }
 
-static ssize_t
-show_media_rc6_ms(struct device *kdev, struct device_attribute *attr, char *buf)
+static ssize_t media_rc6_residency_ms_show(struct device *kdev,
+					   struct device_attribute *attr, char *buf)
 {
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
 	u32 rc6_residency = calc_residency(dev_priv, VLV_GT_MEDIA_RC6);
 	return sysfs_emit(buf, "%u\n", rc6_residency);
 }
 
-static DEVICE_ATTR(rc6_enable, S_IRUGO, show_rc6_mask, NULL);
-static DEVICE_ATTR(rc6_residency_ms, S_IRUGO, show_rc6_ms, NULL);
-static DEVICE_ATTR(rc6p_residency_ms, S_IRUGO, show_rc6p_ms, NULL);
-static DEVICE_ATTR(rc6pp_residency_ms, S_IRUGO, show_rc6pp_ms, NULL);
-static DEVICE_ATTR(media_rc6_residency_ms, S_IRUGO, show_media_rc6_ms, NULL);
+static DEVICE_ATTR_RO(rc6_enable);
+static DEVICE_ATTR_RO(rc6_residency_ms);
+static DEVICE_ATTR_RO(rc6p_residency_ms);
+static DEVICE_ATTR_RO(rc6pp_residency_ms);
+static DEVICE_ATTR_RO(media_rc6_residency_ms);
 
 static struct attribute *rc6_attrs[] = {
 	&dev_attr_rc6_enable.attr,
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
