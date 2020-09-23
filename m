Return-Path: <SRS0=ky/+=DA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED184C4363D
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2020 22:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91D6E235FD
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2020 22:13:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fap5Ksbc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91D6E235FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143086EA08;
	Wed, 23 Sep 2020 22:13:56 +0000 (UTC)
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FCF6EA08
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2020 22:13:54 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id c2so1326869qkf.10
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2020 15:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9WNptpv06UneB7aZbM0n/Fv0ZV97+q6TI709ywtcb8w=;
 b=fap5KsbcIGA+HiEA8ar86MK/968DlLJpDSb+0ybjnlvgX68AgZUWu5tHYqyHBCC//+
 t1hVlz6ZbdMrBkAfZ3jVIcEXDfiuaq9phlWIw4bdUNpRAHorVEc+7r1AgvgpIwyQ4UYq
 VyzVUZtHaNCczzVVE3jh7S8tv5HEij5UXXsOR1bXtSWAhVCXt6F5Xyn90iNZ6fROz6tn
 rmztesTRWvGA+lFqTOV07/H2uIi4Efshs5J5E5CsfdAGT5jn8vDv7OumgQB0hqvpaM5h
 1zhnGREfeBbXa5/1HK6Ttx1LWL72nNY8tuOVMK8w6s+YG3rDT93z9nOOntrilpqK6+uT
 r0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9WNptpv06UneB7aZbM0n/Fv0ZV97+q6TI709ywtcb8w=;
 b=CBhf/7H4iAb7zcU5n5z/TItv3DQzDLBCm3ajz61XPlDifiSdynaE0wB8wMscH1Vsec
 u5tLy2zliWGLD9eUX1C2UETBjaFQiGgp6LG9OQuYJvnFS7tTrbxlVSsNeQ7LSYYprgvh
 8K3+u64FlvrK9nEQ3JzHnOevAwVlezBACCQFVInt5hx84obPxYWPaHD/7ORdgTeWbELK
 uq8PrgVJ+w2I91WOiNoyNV8J/gv8zv2lkR9bEoEMIxQ0Ul8cJ3bBbyI2zFydi+PeI/yI
 7O7sWDMXrmph5D9BSpxgAZV5NV2EqamhCFHBb2fLyuRXBI5on2dUZCedAO3/+H9LKiko
 96JA==
X-Gm-Message-State: AOAM533l5zEorwK4rwdHiLEbJGUDfllHd6HdLbYmo/b6fDTYvuiCsQC4
 Y0Du9GUjbV5Z7U1tUG+wVv3A8E6UAdnAyg==
X-Google-Smtp-Source: ABdhPJy7IOGIVqm383pdXqOoM4hXgxSJWW+pfRLRPfFmzdMkO/1lZbT8fykexbv465e/9QY6BJe07w==
X-Received: by 2002:a37:a1cb:: with SMTP id k194mr2073867qke.354.1600899232902; 
 Wed, 23 Sep 2020 15:13:52 -0700 (PDT)
Received: from cheekon.pramanik.com ([2604:2000:2f80:1100:5a2:1440:32f3:3d13])
 by smtp.gmail.com with ESMTPSA id
 n203sm843281qke.66.2020.09.23.15.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 15:13:52 -0700 (PDT)
From: Satadru Pramanik <satadru@gmail.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 23 Sep 2020 18:13:11 -0400
Message-Id: <20200923221312.2418628-1-satadru@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC PATCH 0/1] Remove DPCD Aux Backlight Control
 PWM_PIN check
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

The Google Pixel Slate/Nocturne device uses a DPCD backlight
which requires Aux Backlight Control to be enabled. This is 
enabled in the ChromeOS kernel trees via disabling the PWM_PIN
check and also an extended heuristic, which was upstreamed 
in 2017, but reverted shortly thereafter due to a regression
on a Thinkpad X1 Carbon 4th Gen as per
https://bugs.freedesktop.org/show_bug.cgi?id=101619

I'm hoping that there is a way to remove that check and not
cause problems for other machines, as otherwise the backlight
is nonfunctional for nocturne, (and possibly for other related
machines such as the eve Pixelbook as well.)

Satadru Pramanik (1):
  Remove DPCD Aux Backlight Control PWM_PIN check

 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
