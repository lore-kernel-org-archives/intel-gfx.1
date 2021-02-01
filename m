Return-Path: <SRS0=l6T8=HD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D3AC433DB
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Feb 2021 11:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D36464E7A
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Feb 2021 11:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D36464E7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3256E546;
	Mon,  1 Feb 2021 11:58:09 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4F96E49C;
 Mon,  1 Feb 2021 11:58:08 +0000 (UTC)
IronPort-SDR: Q+TwiRDl2enRUUYa9lw5XpaqBTJzlshLgfFNBFGEGKc2du7B/DX1p6v3XYidEye4+0ojV+yme+
 Xp1i/yRLl2tQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="265504761"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; d="scan'208";a="265504761"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 03:58:07 -0800
IronPort-SDR: VDfTG44xLOw4/8AOlOdC9ymHHx50oJXOq3IinAUrFH8blNxar4q3CdqX61tvFne6Nnypy3farb
 6bbC9X73WeSQ==
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; d="scan'208";a="369829120"
Received: from rmeir2x-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.214.231.94])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 03:58:05 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  1 Feb 2021 11:57:56 +0000
Message-Id: <20210201115756.876351-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] intel_gpu_top: Wrap interactive header
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
Cc: Intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Slight improvement with regards to wrapping header components to fit
console width. If a single element is wider than max it can still
overflow but it should now work better for practical console widths.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 84 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 71 insertions(+), 13 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index dffc6ebecc57..c43054c3fee8 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1443,6 +1443,41 @@ static bool print_groups(struct cnt_group **groups)
 	return print_data;
 }
 
+static int __attribute__ ((format(__printf__, 6, 7)))
+print_header_token(const char *cont, int lines, int con_w, int con_h, int *rem,
+		   const char *fmt, ...)
+{
+	const char *indent = "\n   ";
+	char buf[256];
+	va_list args;
+	int ret;
+
+	if (lines >= con_h)
+		return lines;
+
+	va_start(args, fmt);
+	ret = vsnprintf(buf, sizeof(buf), fmt, args);
+	assert(ret < sizeof(buf));
+	va_end(args);
+
+	ret = (cont ? strlen(cont) : 0) + strlen(buf);
+	*rem -= ret;
+	if (*rem < 0) {
+		if (++lines >= con_h)
+			return lines;
+
+		*rem = con_w - ret - strlen(indent);
+		cont = indent;
+	}
+
+	if (cont)
+		ret = printf("%s%s", cont, buf);
+	else
+		ret = printf("%s", buf);
+
+	return lines;
+}
+
 static int
 print_header(const struct igt_device_card *card,
 	     const char *codename,
@@ -1520,22 +1555,45 @@ print_header(const struct igt_device_card *card,
 	*consumed = print_groups(groups);
 
 	if (output_mode == INTERACTIVE) {
+		int rem = con_w;
+
 		printf("\033[H\033[J");
 
-		if (lines++ < con_h)
-			printf("intel-gpu-top: %s @ %s\n",
-			       codename, card->card);
-		if (lines++ < con_h) {
-			printf("%s/%s MHz; %s%% RC6; ",
-			       freq_items[1].buf, freq_items[0].buf,
-			       rc6_items[0].buf);
-			if (engines->r_gpu.present) {
-				printf("%s/%s W; ",
-				       power_items[0].buf,
-				       power_items[1].buf);
-			}
-			printf("%s irqs/s\n", irq_items[0].buf);
+		lines = print_header_token(NULL, lines, con_w, con_h, &rem,
+					   "intel-gpu-top:");
+
+		lines = print_header_token(" ", lines, con_w, con_h, &rem,
+					   "%s", codename);
+
+		lines = print_header_token(" @ ", lines, con_w, con_h, &rem,
+					   "%s", card->card);
+
+		lines = print_header_token(" - ", lines, con_w, con_h, &rem,
+					   "%s/%s MHz",
+					   freq_items[1].buf,
+					   freq_items[0].buf);
+
+		lines = print_header_token("; ", lines, con_w, con_h, &rem,
+					   "%s%% RC6",
+					   rc6_items[0].buf);
+
+		if (engines->r_gpu.present) {
+			lines = print_header_token("; ", lines, con_w, con_h,
+						   &rem,
+						   "%s/%s W",
+						   power_items[0].buf,
+						   power_items[1].buf);
 		}
+
+		lines = print_header_token("; ", lines, con_w, con_h, &rem,
+					   "%s irqs/s",
+					   irq_items[0].buf);
+
+		if (lines++ < con_h)
+			printf("\n");
+
+		if (lines++ < con_h)
+			printf("\n");
 	}
 
 	return lines;
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
