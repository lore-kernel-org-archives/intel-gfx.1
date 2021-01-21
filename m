Return-Path: <SRS0=DGqE=GY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A7AC433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 06:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3481B238D6
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 06:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3481B238D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EF36E519;
	Thu, 21 Jan 2021 06:09:36 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98EF6E519
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 Jan 2021 06:09:34 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10L64nZ6056854;
 Thu, 21 Jan 2021 06:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=5RP2nAGErznTpvSk/cGgU+T9P5emh+XNvStnJcJMHiU=;
 b=INvxb7JXl5Zl/ZkRE18bRSVZV4GeXU99WvUbIFHSCQSOI+ADLBayOIh0SBpiSh6gaFqU
 VMnq9HfLNrfZbfb7jDCIucLNqmye44Sp/BhO9EnzCn9jJ6b/nY2Vb9iy6wsV9Kwr9TSx
 vep5d8YEs4zgVjPvRfMae86w09jL0KTT+zsQyWrXfu5rRTOZ/sSiCmVujHWefvVy2lq3
 Y2OXDcbYV2+1bsOLQ+dFtXIRqMu5BREH1frWrhnAJLb97HlgXiH0NMS7zsamuKGxRmog
 5fkDgYCkwFHwzToWCqvcRWqRxqweGPQTqGn/SSTrc0uIM0lpB2C01SnPwUF6XXUj3O8X Ww== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 3668qmwq9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 06:09:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10L64mP1002849;
 Thu, 21 Jan 2021 06:07:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 3668qxh0ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 06:07:22 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10L67A3K016079;
 Thu, 21 Jan 2021 06:07:10 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 20 Jan 2021 22:07:09 -0800
Date: Thu, 21 Jan 2021 09:07:01 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Message-ID: <YAkaBa22zvbXKd4E@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210031
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1011 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210031
Subject: [Intel-gfx] [PATCH] drm/i915/dp: Fix a logical vs bitwise OR bug
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Sean Paul <seanpaul@chromium.org>,
 intel-gfx@lists.freedesktop.org, Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This was supposed to be | instead of ||.

Fixes: 522508b665df ("drm/i915/display: Let PCON convert from RGB to YCbCr if it can")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 8a00e609085f..9c6f427b2703 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6955,8 +6955,8 @@ intel_dp_update_420(struct intel_dp *intel_dp)
 							intel_dp->downstream_ports);
 	rgb_to_ycbcr = drm_dp_downstream_rgb_to_ycbcr_conversion(intel_dp->dpcd,
 								 intel_dp->downstream_ports,
-								 DP_DS_HDMI_BT601_RGB_YCBCR_CONV ||
-								 DP_DS_HDMI_BT709_RGB_YCBCR_CONV ||
+								 DP_DS_HDMI_BT601_RGB_YCBCR_CONV |
+								 DP_DS_HDMI_BT709_RGB_YCBCR_CONV |
 								 DP_DS_HDMI_BT2020_RGB_YCBCR_CONV);
 
 	if (INTEL_GEN(i915) >= 11) {
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
