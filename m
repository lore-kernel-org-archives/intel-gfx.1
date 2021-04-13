Return-Path: <SRS0=Tqpp=JK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DFEC433B4
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Apr 2021 17:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ED00611F0
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Apr 2021 17:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ED00611F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jlekstrand.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11EA89906;
	Tue, 13 Apr 2021 17:33:06 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A0789906
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Apr 2021 17:33:05 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id o123so11886869pfb.4
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Apr 2021 10:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QadX2l/VhCoDiQq02W1wFzM6BXAUhVOUpocDgwaR3kk=;
 b=yKnZHe/y1S1yTFPJly1RPRZyhQB2gOYQea52OEKqONRs9cqVnOtSTSuUcY59Qie51x
 TeS0iPimeYUJu0AMT+Sfhcpi9dPoJnxtkV/TtezWdQ5hi7Ah9z6eoSXIJYdjFKkD6YHo
 NmM/ENWS796FhE6o+5WS46Hu28B4uXzESKcHOLnTgdzc0xNwQTI521iTaXDaVNXOO8or
 bJGsh04ECH9GEDqAux2z8FCHYEWSXPf10NWe7iUCJiPAT88/Jg/VHw0FHmZIirqOeoPt
 Ij/mWdMc8yXFxdGGlYZzSwx9YLwpfIiTtfnbfKz1yRavDPxN5SaNdjtPFStni9DXbsTL
 LWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QadX2l/VhCoDiQq02W1wFzM6BXAUhVOUpocDgwaR3kk=;
 b=T7Wo8YeBi5ith5d+gwXYCqi/nLTVOe20xWCsoVB2O0LdxnGaU9E/Vz46ZCBtDCP6W0
 RJBChRqA5zZaWfYt4FqMpM6PRyRs47qKT+qgG9p9tRO2Kz8ovcYMVUPdiYblONQYULBF
 10MhmjKBCvCncdoQki3nyCc+I7If6OjsBtx45lWs76d+UHERqmQu8NvQsxWcl52VKScr
 dzVMJ0peP6alMNdT9tamOh4sk1hp01b8geyvqM643zuN2KAMf/LRBzGX+I2CmcdHNfno
 u7GAdxNIfh73KKlU1LszuJT0VGrnB40ZDqHacgzSw3Q6WFu7RP+nT/GjnUGwpzuRXcVm
 TUSw==
X-Gm-Message-State: AOAM532FgSq8j15MZLuY+QS6QSfS1ibQOEpUqVPlRhdCtZiYr7YVtTdA
 E1IkmIU6XC80rbp3SBuAosSpMQ5IN9HMWw==
X-Google-Smtp-Source: ABdhPJyb3fTQSaOZSC7CW/OTjYNX10ZsdkbJ2p/TuWHKhkl/nv/+f6ySCDAi2AMlVqSh0+8qcCGFDw==
X-Received: by 2002:a63:c446:: with SMTP id m6mr32207237pgg.71.1618335184909; 
 Tue, 13 Apr 2021 10:33:04 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id a6sm13504205pfc.61.2021.04.13.10.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 10:33:04 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 13 Apr 2021 12:32:59 -0500
Message-Id: <20210413173259.472405-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/pm: Make the wm parameter of
 print_wm_latency a pointer
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

VGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yIHdpdGggR0NDIDExOgoKICAgIElu
IGZ1bmN0aW9uIOKAmHNuYl93bV9sYXRlbmN5X3F1aXJr4oCZLAogICAgICAgIGlubGluZWQgZnJv
bSDigJhpbGtfc2V0dXBfd21fbGF0ZW5jeeKAmSBhdCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRl
bF9wbS5jOjMxMDk6MywKICAgICAgICBpbmxpbmVkIGZyb20g4oCYaW50ZWxfaW5pdF9wbeKAmSBh
dCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wbS5jOjc2OTU6MzoKICAgIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2ludGVsX3BtLmM6MzA1ODo5OiBlcnJvcjog4oCYaW50ZWxfcHJpbnRfd21fbGF0
ZW5jeeKAmSByZWFkaW5nIDE2IGJ5dGVzIGZyb20gYSByZWdpb24gb2Ygc2l6ZSAxMCBbLVdlcnJv
cj1zdHJpbmdvcC1vdmVycmVhZF0KICAgICAzMDU4IHwgICAgICAgICBpbnRlbF9wcmludF93bV9s
YXRlbmN5KGRldl9wcml2LCAiUHJpbWFyeSIsIGRldl9wcml2LT53bS5wcmlfbGF0ZW5jeSk7CiAg
ICAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
bnRlbF9wbS5jOiBJbiBmdW5jdGlvbiDigJhpbnRlbF9pbml0X3Bt4oCZOgogICAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfcG0uYzozMDU4Ojk6IG5vdGU6IHJlZmVyZW5jaW5nIGFyZ3VtZW50
IDMgb2YgdHlwZSDigJhjb25zdCB1MTYgKuKAmSB7YWthIOKAmGNvbnN0IHNob3J0IHVuc2lnbmVk
IGludCAq4oCZfQogICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYzoyOTk1OjEzOiBu
b3RlOiBpbiBhIGNhbGwgdG8gZnVuY3Rpb24g4oCYaW50ZWxfcHJpbnRfd21fbGF0ZW5jeeKAmQog
ICAgIDI5OTUgfCBzdGF0aWMgdm9pZCBpbnRlbF9wcmludF93bV9sYXRlbmN5KHN0cnVjdCBkcm1f
aTkxNV9wcml2YXRlICpkZXZfcHJpdiwKICAgICAgICAgIHwgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fgoKQXMgZmFyIGFzIEkgY2FuIHRlbGwsIHdlIGRvbid0IGFjdHVhbGx5IG5l
ZWQgOCBlbGVtZW50cyBleGNlcHQgb24gU0tMCmFuZCB0aGF0IHVzZXMgZGV2X3ByaXYtPndtLnNr
bF9sYXRlbmN5IHdoaWNoIGhhcyBlbm91Z2guCgpTaWduZWQtb2ZmLWJ5OiBKYXNvbiBFa3N0cmFu
ZCA8amFzb25Aamxla3N0cmFuZC5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxf
cG0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pbnRlbF9wbS5jCmluZGV4IDNmNmQ4YjUwMmE2MTkuLjU5NDk4Nzk0YWM0
ZWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BtLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYwpAQCAtMjk5NCw3ICsyOTk0LDcgQEAgaW50IGls
a193bV9tYXhfbGV2ZWwoY29uc3Qgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQog
CiBzdGF0aWMgdm9pZCBpbnRlbF9wcmludF93bV9sYXRlbmN5KHN0cnVjdCBkcm1faTkxNV9wcml2
YXRlICpkZXZfcHJpdiwKIAkJCQkgICBjb25zdCBjaGFyICpuYW1lLAotCQkJCSAgIGNvbnN0IHUx
NiB3bVs4XSkKKwkJCQkgICBjb25zdCB1MTYgKndtKQogewogCWludCBsZXZlbCwgbWF4X2xldmVs
ID0gaWxrX3dtX21heF9sZXZlbChkZXZfcHJpdik7CiAKLS0gCjIuMzEuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlz
dApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
