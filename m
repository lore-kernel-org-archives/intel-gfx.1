Return-Path: <SRS0=+CuI=FT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF1EC4361B
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Dec 2020 14:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 214EE22516
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Dec 2020 14:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 214EE22516
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EED6E342;
	Tue, 15 Dec 2020 14:41:12 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BB26E342
 for <intel-gfx@lists.freedesktop.org>; Tue, 15 Dec 2020 14:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608043270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F8joEElleXKdzZZoOlmFpnV8pMLwxW0aIioc9VmMinw=;
 b=Vp0E5UbSd/2CmBEIcKSVjOX/QgIG1XfrjlvB8FAU8VUXvlFNXUbnzmvH7DBHXVfEwjDfat
 /dBM4DwYCkJ2jVsTR8CbbGg6jZY/01KNv35qbvPNqf8n09DCThbfY6T/qUOPzTXr6bF7SA
 u07IHFHEJlLUekoHdrx+ipg2ovuD5CU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-icRJVWI6NX6QhCelxyaXbQ-1; Tue, 15 Dec 2020 09:41:08 -0500
X-MC-Unique: icRJVWI6NX6QhCelxyaXbQ-1
Received: by mail-qt1-f198.google.com with SMTP id f7so14455573qtj.7
 for <intel-gfx@lists.freedesktop.org>; Tue, 15 Dec 2020 06:41:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8joEElleXKdzZZoOlmFpnV8pMLwxW0aIioc9VmMinw=;
 b=UjQuC1VQB6EffGOuJh+KNmbYR8z7L6cK+eTHs747WV3+uXxjz85qTRv+yWjbOnKgbW
 PKuiXQWMXtyTdTdR7IgNwCjFqL4o2yjunZbv+SwTvOq/r3LtQ6c52W6LfpUHOF8aOoWw
 K58RswFKrF4nI0Pmg51noJgjjm9cWw7WAXsZynYk4kCpGuHpyjoqfLx1oGWp+/xGLlN5
 WdNG6Be7xDkIRJ4L4aPpZ3ZiFjyeHEPswU8FB13UOnxJ24Vb4Kez0TcloUGILljNjndl
 mByrQdx04KfxMrrTuTdhrGVPKxJ3D4qZ3JvwFG3iZPzFIYbuFmG2PRRglzmb1e3S785s
 F+1Q==
X-Gm-Message-State: AOAM532E1Yg3pWW4j3uicj5h9CftynuxKkLgrjyPPmHdMEqUmqMmFhCT
 tXggL3qytBvTZXrnyFH4XUts6WNmgkhfcUUhFq3RLmnDQN9ccK2zSq3lP6eSJLDsBRaZWN5xfcp
 OYJeoEx4FberJkMkGzI0Ojqw3LDAM
X-Received: by 2002:ac8:588c:: with SMTP id t12mr35766781qta.184.1608043268254; 
 Tue, 15 Dec 2020 06:41:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0aOW3zgklpzEA6VS9bGbEduK40Txfz03DgS33CSsoQvHcRVw60dBnH0UPlARX48A3H9vH8Q==
X-Received: by 2002:ac8:588c:: with SMTP id t12mr35766768qta.184.1608043268018; 
 Tue, 15 Dec 2020 06:41:08 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id b6sm16306599qkc.128.2020.12.15.06.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:41:07 -0800 (PST)
From: trix@redhat.com
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com,
 tejaskumarx.surendrakumar.upadhyay@intel.com,
 lionel.g.landwerlin@intel.com, venkata.s.dhanalakota@intel.com
Date: Tue, 15 Dec 2020 06:41:01 -0800
Message-Id: <20201215144101.1878719-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Intel-gfx] [PATCH] drm/i915: remove h from printk format specifier
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
Cc: Tom Rix <trix@redhat.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

See Documentation/core-api/printk-formats.rst.
h should no longer be used in the format specifier for printk.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index 8a72e0fe34ca..80be9e818a6b 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -755,7 +755,7 @@ void intel_sseu_print_topology(const struct sseu_dev_info *sseu,
 		for (ss = 0; ss < sseu->max_subslices; ss++) {
 			u16 enabled_eus = sseu_get_eus(sseu, s, ss);
 
-			drm_printf(p, "\tsubslice%d: %u EUs (0x%hx)\n",
+			drm_printf(p, "\tsubslice%d: %u EUs (0x%x)\n",
 				   ss, hweight16(enabled_eus), enabled_eus);
 		}
 	}
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
