Return-Path: <SRS0=yDSU=MA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860BAC07E9E
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Jul 2021 17:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5564C61879
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Jul 2021 17:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5564C61879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B666E97C;
	Thu,  8 Jul 2021 17:38:26 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A356E979
 for <intel-gfx@lists.freedesktop.org>; Thu,  8 Jul 2021 17:38:25 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 j16-20020a05600c1c10b0290204b096b0caso4548371wms.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 08 Jul 2021 10:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QjSmqlbIRb4rQlv/d4Pv/+GvfrOLmD0Jb/5nkyL4HJI=;
 b=OXWAMqyAm3FBqCmhazvtViPAczIYbDg3o3MhmkkOYXWZo3KasFE7n0nAJn3tBoiheQ
 Uz11jDhuINyDdsI4jhUSXimf8CsgIs+yJX8P1fVDe1tZR1ck2fHGWEufuZbQ6Hyvcg3Y
 SBMM8LmNDEAE4LoiP5rbz1j7aL4QlTe7Ad8Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QjSmqlbIRb4rQlv/d4Pv/+GvfrOLmD0Jb/5nkyL4HJI=;
 b=mM3mFCCJUp/ghjNt+U+fY1XZIp9lJfmVxD6fZIVeHgevyR0t6WgX6X5k8nbll15L6M
 JiXfpVCaqc9F9sou3OXKPosNR0bJg82k6SVxpuzICkd6A+XwlWFJ/GeT+XtkDbBQek6r
 siGdsiLq2y8pvGFC5vwTAB8/6FqWJWwjEfoj4XDFR3EC5CL+TTEL0G9ZkG5KCJUnl2Fg
 B1tmrUr/UYReUeJTd0QV+sjETI9px5A5maBMH9RNvJBDWhMQmH2PBBMNNIciqeqhb3rW
 tb+4y+2oO3nsNEYwu/mF6q6pCfb15BX116NFPgDxGPD83nMqH7i8nECUOito4MC/HXzo
 83rw==
X-Gm-Message-State: AOAM532v4p4L6QgcNc4zulPAI8u61pJJa+OxplX6xHUuAtwlXtMBocVt
 v0sZg4CtR/BcxPxNqhdnsBH0oA==
X-Google-Smtp-Source: ABdhPJw1jshJuGMwGuQ/le1CCh7zRdTpRm7R19534t5pFRk1PSYScUvtSH1ZQ65X5JqJpvpszXLP4A==
X-Received: by 2002:a1c:4302:: with SMTP id q2mr6565057wma.37.1625765904147;
 Thu, 08 Jul 2021 10:38:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:38:23 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Thu,  8 Jul 2021 19:37:50 +0200
Message-Id: <20210708173754.3877540-17-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 16/20] drm/msm: always wait for the exclusive
 fence
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
Cc: freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+
CgpEcml2ZXJzIGFsc28gbmVlZCB0byB0byBzeW5jIHRvIHRoZSBleGNsdXNpdmUgZmVuY2Ugd2hl
bgphIHNoYXJlZCBvbmUgaXMgcHJlc2VudC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KW2RhbnZldDogTm90IHRoYXQgaGFyZCB0byBj
b21waWxlLXRlc3Qgb24gYXJtIC4uLl0KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4K
Q2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtl
cm5lbC5vcmcKQ2M6IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbXNtL21zbV9nZW0uYyB8IDE2ICsrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9tc21fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW0uYwpp
bmRleCAxNDExNzg3NTQyMzEuLmQ5YzRmMWRlZWFmYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9tc21fZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMKQEAg
LTgxMiwxNyArODEyLDE1IEBAIGludCBtc21fZ2VtX3N5bmNfb2JqZWN0KHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqLAogCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlOwogCWludCBpLCByZXQ7CiAK
LQlmb2JqID0gZG1hX3Jlc3Zfc2hhcmVkX2xpc3Qob2JqLT5yZXN2KTsKLQlpZiAoIWZvYmogfHwg
KGZvYmotPnNoYXJlZF9jb3VudCA9PSAwKSkgewotCQlmZW5jZSA9IGRtYV9yZXN2X2V4Y2xfZmVu
Y2Uob2JqLT5yZXN2KTsKLQkJLyogZG9uJ3QgbmVlZCB0byB3YWl0IG9uIG91ciBvd24gZmVuY2Vz
LCBzaW5jZSByaW5nIGlzIGZpZm8gKi8KLQkJaWYgKGZlbmNlICYmIChmZW5jZS0+Y29udGV4dCAh
PSBmY3R4LT5jb250ZXh0KSkgewotCQkJcmV0ID0gZG1hX2ZlbmNlX3dhaXQoZmVuY2UsIHRydWUp
OwotCQkJaWYgKHJldCkKLQkJCQlyZXR1cm4gcmV0OwotCQl9CisJZmVuY2UgPSBkbWFfcmVzdl9l
eGNsX2ZlbmNlKG9iai0+cmVzdik7CisJLyogZG9uJ3QgbmVlZCB0byB3YWl0IG9uIG91ciBvd24g
ZmVuY2VzLCBzaW5jZSByaW5nIGlzIGZpZm8gKi8KKwlpZiAoZmVuY2UgJiYgKGZlbmNlLT5jb250
ZXh0ICE9IGZjdHgtPmNvbnRleHQpKSB7CisJCXJldCA9IGRtYV9mZW5jZV93YWl0KGZlbmNlLCB0
cnVlKTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CiAJfQogCisJZm9iaiA9IGRtYV9yZXN2
X3NoYXJlZF9saXN0KG9iai0+cmVzdik7CiAJaWYgKCFleGNsdXNpdmUgfHwgIWZvYmopCiAJCXJl
dHVybiAwOwogCi0tIAoyLjMyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ludGVsLWdmeAo=
