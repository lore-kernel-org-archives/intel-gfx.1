Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AE5CA5FDD
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Oct 2026 20:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C1310FA33;
	Fri,  2 Oct 2026 20:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.b="j43R8RGX";
	dkim-atps=neutral
Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com
 [74.125.229.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0CC10E686
 for <intel-gfx@lists.freedesktop.org>; Fri,  2 Oct 2026 19:40:36 +0000 (UTC)
Received: by mail-dl2-f40.google.com with SMTP id
 a92af1059eb24-14fe2605d85so247056c88.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 02 Oct 2026 12:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=trailofbits.com; s=google; t=1790970035; x=1791574835;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/6OS7kHnRAUFDH89g48qhMuuszS5BgPSQDnnJTJS0d4=;
 b=j43R8RGXPCtuTLg6uZoXrx4LmV5X6J07MtjEEy1sGQOz+lVd98U8GzXzKXrQhSgE2N
 5zbGJSPZOj8TGyhrtxJ6lb0bkRorXxOI1W6P2FKO8jBGFy3dDKu3qJtWoIAAwl7Qtdb5
 bJGYsZfNXOVrc8rdt9gx61Jgum04mBdQdlwYT7HYhJLKR3XUwUp8gidBTXLEwAQJjaFU
 sLnp8vKtyariFTaNrPF+1O6BxN3tt0Y5BtuS134wJbAgx+DeGk7vAqCdDvBDwu41eb8L
 zXA/W70FaLKP0+E56PgWEhJSsfNMqgbk+LGsDw2E1Nr/s/PADQov4KOsT6HapvQKN645
 uycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790970035; x=1791574835;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/6OS7kHnRAUFDH89g48qhMuuszS5BgPSQDnnJTJS0d4=;
 b=Mu1WB83lGwM77HQ7l+UoLVzUyJN0K4448/QLEnjJBfudDrYBV6ZVWOhBLlR2kUg+ad
 248Idd1N/DEN/8DFp92cRl5r4JtjivduW6dHNr8p1AqznZ8imaJrm0AhhdCPdCY3qtEp
 01+hAFcwKqb1LUOYtoJ87lTr3EM8pandY3jJuz698gASPEzonYLPzgbe5xnNHHx87L8Y
 JHmanAmb3Ab/Q1C3WFoBmCtOluD04fy8CzdSvHhYH7p685yIGLjuhN6EKN35VA3PHdJ6
 LhHE5p+hKYNqSC8FihWa/FOkwAkP1E75zREbcmbr+kGj4hV6qtzahFJsbQ3RuHAr98Pf
 HSSA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwWGPIYgrZe4W/MT8MaMck7a0FHDDnv3WO2XX/HLB6OmYyPFinQQpt0GTOzWnUJERw3RO8PBWYBuHk=@lists.freedesktop.org
X-Gm-Message-State: AFuF++mR2ucvD7izf0JRe+D0lr7/CGBtR0YDnkOXk3Adu2EMv59LwWbA
 x/NDPY8J8FoZ/0usbLUsoAxMr2wEKlwUrnqtJEiCfbPAcYn1MvcxzNZsksd0VMeQGLI=
X-Gm-Gg: AYBFou13lqmxwQ75GlYfrr8Ry/EBLA4uLnwVEIXdYnPhLOAesomlL3VLMa4A+z7CUNX
 LIRtJA0g73y0UAms5ZxZDxhV+ujUboY8P4Jm8ibkjyhKylylkdeyuWNzNq9ORaJgLkv4NKDUFzk
 txkYJQnzphFNTWIA8I1cuPK1r2WjWF6kNBHdH8fnEc8tpxsijXrLCsTqATfj+TLzT7NnPoNXCJn
 8kUPs7nL/Lm2kAqXyiS9BMY2K3OKJ8qwMBztF3ozunMdZGazfCRakFGUxI/5ss251OURSLMZGrr
 FDTt44t2mUcj6MeZFhdjZctZLqx6KYWg/6nvji3hfnGE3ZjpT2+MyTXMNB20+pIQFwZfjdLY114
 9d2tC09d/TeF09LxkOg1gCOhY/BW/KQ+5RJC2Xe5Mt7hGICVeOHczYHOj0AR24g2ZjMF3wJONU4
 UAw9WJB8giy98Y0OcaFJunM7JdTyt9yxaU2ZQ+xisOm6D2vhDYb4RWnQNMA+TbfllCDnzDLThi7
 TXf7JJ09HwjSkQu8dxaRHgjFJTJyUl8u9iTnsmp8CsZCHasqzF0LL3AdbO6qejnVd0RO6lHViAH
 c+sLLQ==
X-Received: by 2002:a05:701b:2610:b0:147:a685:9125 with SMTP id
 a92af1059eb24-14f58fd2a97mr3391373c88.2.1790970035055; 
 Fri, 02 Oct 2026 12:40:35 -0700 (PDT)
Received: from localhost.localdomain
 ([2603:8001:5f01:8bab:bcf9:6140:24a9:d1e7])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14f47a57592sm7450113c88.17.2026.10.02.12.40.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 02 Oct 2026 12:40:34 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, Suraj Kandpal <suraj.kandpal@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org
Subject: [PATCH 6.1.y 0/2] drm/i915/hdcp: guard both capability checks
Date: Fri,  2 Oct 2026 15:40:25 -0400
Message-ID: <20261002194030.20489-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Oct 2026 20:45:17 +0000
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Greg, Sasha, and i915 maintainers,

Patch 1 alone is not enough on 6.1.y: intel_hdcp_info() calls
intel_hdcp_capable() and then intel_hdcp2_capable(), so the debugfs NULL
dereference moves to the second call. Patch 2 is the companion fix that
path needs, a backport of upstream commit d34f4f058edf ("drm/i915/hdcp:
Add encoder check in hdcp2_get_capability") with the guard in the common
intel_hdcp2_capable() helper, where 6.1.y still does the lookup. This
mirrors the 2-patch series picked up for 6.6.y, and both fixes are
already present in 6.12.y, 6.18.y, and 7.2.y. Could you please queue both
patches for 6.1.y?

AI assistance: An LLM helped adapt and validate both patches; I reviewed
the resulting code and validation evidence.

Thanks,
Artem Dinaburg

Series:
  1. drm/i915/hdcp: Add encoder check in intel_hdcp_get_capability
  2. drm/i915/hdcp: Add encoder check in hdcp2_get_capability
