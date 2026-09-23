Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5815EC9830E
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2026 19:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D7810FC36;
	Fri, 25 Sep 2026 19:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="ftGXLmD9";
	dkim-atps=neutral
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com
 [74.125.227.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6146210E89C
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 15:25:10 +0000 (UTC)
Received: by mail-vs2-f12.google.com with SMTP id
 71dfb90a1353d-5c67e5059f9so648501e0c.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 08:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1790177109;
 x=1790781909; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EZh4tpz1qULZcD5BqOExpc6yQOG+i8+o67CAd0o+69Q=;
 b=ftGXLmD9xN9lUiptXMstP1nNnqfo1QYjFjR3HqSF/fxSGIhARpjgvqpb3Xaoq7bC9J
 OlgVOQFVKyI0BgCpNL+7KNNbugcKddxQ1nMr4XmtkGds+RMG6RR6N97dq8q+VVN82sxp
 rfk1DwrNPp5HfpHz9LlNWPLw7qwuOasWjh2ty0ZdwG0vIuIZclSUF709XDTbxS6EZgro
 loIeDKyp5Sg7XUqj1E3Dwd/h4gplp3hserraetTwXejfnAoGkM7dmXjSOTVteMy330jd
 1FgSgZRDdSsTSkF9CEUwsg4vXOWJBqNLbUtXm2YTNqVasJ1MUink7FbFMXnSYO/Nk7jl
 lT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790177109; x=1790781909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EZh4tpz1qULZcD5BqOExpc6yQOG+i8+o67CAd0o+69Q=;
 b=Z9qZx9JSMmdkRAE9g5H2Bk5kOhOBA3mK+EthOgVuveQidu0zBMyUlwgdUuMYNj3eVZ
 CSW4fBO6sRku5FqZT2zxdhGqqTL1k0QkbOrMI5ZVaG2+06TRQPEZ15+f8MfVGodcdLuC
 PVkvkwsaOBWhkbLVDAS4xPttXq97ABmkMe6R2VtkGjmSYcotxA+y33mQsC2TlQZ5gz9A
 Pu8UMZMlTvLuKIAZsjfkF6m68I3oNsP77E04iJsVBOsXSXKSCGVlyyudcLIucLpaaUWI
 8ZeqMNIYtKbLDinqzMOh0MHBEp41QoOy459vwYSJF3VpFv6RoecmgijK0gzl2SnEIjJu
 1SiA==
X-Gm-Message-State: AFuF++k/ffyxu76VfHV9crmrOz938pyecBlHZpwQFmh5OOxKMBSeEAZX
 2ib1jwjP0+7ZdHRsoDaC/5VUozIFdaZYn3hIpysdobYsMM0QtuBZ4Rt844WLaLWyzzmyYm58iEn
 +eBmAD2kGYeSINa+OZ1F8N8dku9HKMUEDDyqUb/p5kHgpVH2QZVfFMeZdiljX14tZ0PTVeAh0AR
 7jtFkbk7CF0mpaVqm8TmNHgUSyr5/8BeOq8mpbFcG/BmoZMT2ljBgA6K4=
X-Gm-Gg: AYBFou1f/wBw/Kq2rPiQLDkYQSXfH3rg20lkTeXgReZ/mHN2Z5qKjw/lCyKzRPZY9SS
 criaxc0IZ0yYUtTK8wefu6A4Foaz2b1zX39/Cfr3jelwu9m8i0RbeXfqVJIbkwXNxjTw7fYcXlN
 +5kEIrNm8hYDaotpAQibXlhuv7nz4Ljfs2cnnROusH+NR7kQILQG5kqYylWU5Xj3fDhV/ZHsAx0
 dKMKr7vinhbG08N6k/xvU0/NBDDqXTBYTsNBMZVrGsP+aoF3dd0KoOPKLSGnMHJazgmNjmjOaD3
 rXZKIpeHTlvFNKtv1C1YNaLtKQMABte2LIaN8I8rylXh2aE5eW9GqPqJvfoth8LlHIwerC57/k7
 FUjPSuSwtuj85hwfje7L9jpBruBjnfNd7dnunlpBpxLpigEWZVMijUJiYAtx3LSYOHZBdvbt7Kc
 wzvvd75UPIVfg3nQszt8Mzydsdm5WdDU65AiL4hDoc/LqadHxqhYOXPUFOKyY4b+NGd1xbUvQHe
 o1ZVaM+he2OLfXvNltANwBXZEmt9I3TnCxWDajnhs3jvDVVrnlGjXwLZ4sVhZFCheTvWlKS3qZD
 7i70UqhO/m20awetOSesHZbHi0p0Kk721e8Vr2SD8HoBKXTSu2CYhXe5C4MIQeA=
X-Received: by 2002:a05:6122:d9c:b0:5c9:a617:580f with SMTP id
 71dfb90a1353d-5c9f16563c0mr3488766e0c.12.1790177109089; 
 Wed, 23 Sep 2026 08:25:09 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::12ac])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5c9f053f9b2sm3347672e0c.14.2026.09.23.08.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 08:25:08 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH] drm/i915/dp: Don't promise AS SDPs in PR Active when they
 are disabled
Date: Wed, 23 Sep 2026 11:25:06 -0400
Message-ID: <20260923152506.1546922-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923142721.183E61F000FF@smtp.kernel.org>
References: <20260923142721.183E61F000FF@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Sep 2026 19:11:15 +0000
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

On Wed, 23 Sep 2026 sashiko-bot wrote:
> Is intel_alpm_pr_as_sdp_skip_frames_enabled() defined anywhere in this tree?

The patch is based on drm-intel-next / drm-tip, which have the AS SDP
skip frames series (8dbe5c47ca42, dc0fd724e13a, eddf77ff1a23,
9ed39b7d74b4). intel_alpm_configure_pr_as_sdp() and
intel_alpm_pr_as_sdp_skip_frames_enabled() come from that series, and
the patch builds there with W=1 for both i915 and xe. The tree used for
the review predates it. I'll add a base-commit line next time.

Jake
