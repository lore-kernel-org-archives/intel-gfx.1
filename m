Return-Path: <SRS0=QgXV=DC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E0CC4363D
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2020 13:17:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FED323718
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2020 13:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FED323718
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8CF6ECE8;
	Fri, 25 Sep 2020 13:17:00 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770A96ECE8
 for <intel-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 13:16:59 +0000 (UTC)
IronPort-SDR: yhtdnjJRJm3g460EXxqLsJx6w4JV1TsNqR8iNklqAvRsZAIs4UZuddjP0B1/kwuL19UXKhBYPw
 gul8P3G/0Zww==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="246302201"
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="246302201"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 06:16:59 -0700
IronPort-SDR: 8ivMu7ZMiQsJg8Bx+qnJIGW2icJ5aoDzA780ylIckMmoz+uNDRwfzTO+0qIA9DSXSci7Gnn6iO
 IINtJp4ZCRbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="348382776"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 25 Sep 2020 06:16:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Sep 2020 16:16:56 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 25 Sep 2020 16:16:47 +0300
Message-Id: <20200925131656.10022-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/9] drm/i915: Finish (de)gamma readout prep bits
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBlYXN5IHByZXAgc3R1ZmYgZnJvbSBteSBlYXJsaWVyIChkZSlnYW1tYSByZWFkb3V0IHNlcmll
cy4KQWxsIHJldmlld2VkIGFscmVhZHkgYnkgVW1hICh0aGFua3MpLiBUaGUgcmVzdCBvZiB0aGF0
IHNlcmllcwpzdGlsbCBuZWVkcyBzb21lIHdvcmsuCgpWaWxsZSBTeXJqw6Rsw6QgKDkpOgogIGRy
bS9pOTE1OiBGaXggc3RhdGUgY2hlY2tlciBody5hY3RpdmUvaHcuZW5hYmxlIHJlYWRvdXQKICBk
cm0vaTkxNTogTW92ZSBNU1QgbWFzdGVyIHRyYW5zY29kZXIgZHVtcCBlYXJsaWVyCiAgZHJtL2k5
MTU6IEluY2x1ZGUgdGhlIExVVCBzaXplcyBpbiB0aGUgc3RhdGUgZHVtcAogIGRybS9pOTE1OiBz
L2dsa19yZWFkX2x1dF8xMC9iZHdfcmVhZF9sdXRfMTAvCiAgZHJtL2k5MTU6IFJlc2V0IGdsayBk
ZWdhbW1hIGluZGV4IGFmdGVyIHByb2dyYW1taW5nL3JlYWRvdXQKICBkcm0vaTkxNTogU2h1ZmZs
ZSBjaHZfY2dtX2dhbW1hX3BhY2soKSBhcm91bmQgYSBiaXQKICBkcm0vaTkxNTogUmVsb2NhdGUg
Q0hWIENHTSBnYW1tYSBtYXNrcwogIGRybS9pOTE1OiBQb2xpc2ggYmR3X3JlYWRfbHV0XzEwKCkg
YSBiaXQKICBkcm0vaTkxNTogUmVwbGFjZSBzb21lIGdhbW1hX21vZGUgaWZzIHdpdGggc3dpdGNo
ZXMKCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmMgICB8IDEyNCAr
KysrKysrKysrKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXkuYyB8ICAyNSArKy0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oICAgICAg
ICAgICAgICB8ICAgOSArLQogMyBmaWxlcyBjaGFuZ2VkLCAxMTMgaW5zZXJ0aW9ucygrKSwgNDUg
ZGVsZXRpb25zKC0pCgotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pbnRlbC1nZngK
