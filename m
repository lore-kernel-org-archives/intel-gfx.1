Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9160BC9832C
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2026 19:11:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D232B10FC28;
	Fri, 25 Sep 2026 19:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UWttT2gq";
	dkim-atps=neutral
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com
 [74.125.230.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C151610FA45
 for <intel-gfx@lists.freedesktop.org>; Fri, 25 Sep 2026 12:52:47 +0000 (UTC)
Received: by mail-qk2-f13.google.com with SMTP id
 af79cd13be357-939656ff6d9so92117085a.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 25 Sep 2026 05:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790340767; cv=none;
 d=google.com; s=arc-20260327;
 b=EWjrxzCmCFmZ+Y+hlf8nNiCK8mZ1+m3E7VKYIwDLrhNKgKLK4lF30sQMvNpuhM95if
 zrqPMUezKJyCgihw240PrWSh9ZROwxQtExje5WOuk/w00V5GJTGFriAcgoUKZUlmpIdu
 aPCoNX3Y6DuSM+EF1hWPt4Z902R0hRqDe/T6ipO/f5QyrIEYW08uEwGQM1he+kCcKEmv
 z1WngQTo93968Wr/P/oBWYQtwKLNXhbWn8qnL7P/wqT1lc4pfQSYW+V1EFkxBZRTVlFA
 s2wV7XypInaL+NhgUoPXPLte7pwoKv7zIvjTqwJHzpfuzDXSF1CAfTHG02jkyj9DZKD9
 8D0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=9LWDCzcn0ysfmdsUdgkxA//1tZg5vvX+0Vm1HrB/0WM=;
 fh=UTsqFai/n+KyO3hID7NFEwj4v64mfikmS6A9/qAuAzg=;
 b=e22SSsDPwTz231EXMg706JcdaX4xZNsLWolAfG1uJ3OY0bimdrBk7g4dwMhU5f+dK8
 tCEu/gB3SQtbq6WWlzfd4wFvdGhQKpxjxP4m6XA2lIVbtAhaGr1JKud11fTnpmSJl/fm
 tVEyBO28fVLhFvVaw4synl47zmWQMLIbTKE0jKfLgvKCnzc3nMRG/yE8fiLy2oL7O5bp
 bicVB5J6TEY/mlKuDbkX72rjIduX5jexBbx6icLEQ58mGTC98EojpzeyiEoKTEtvEVff
 VvpIg5DkUY2J0WPTTpySoNYvkVeoBvEHTaNfkZFepth5TjB6o4+Klce2WNYrYhLrj8KN
 20EA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790340767; x=1790945567; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9LWDCzcn0ysfmdsUdgkxA//1tZg5vvX+0Vm1HrB/0WM=;
 b=UWttT2gqZVLPbAc3FiQ6UUGZWc71HKtC/B9fYuDd5qL85uSR+/wc9OtTujQ9mTJw0W
 UO7LxC4yuGDfZ7UcyjXLpjhi4WO407347tRmvp8U8YJHROJ82XEugNWIy44v/suliVg3
 isYdQHw3bbfMqgLWvrwNMuPhuv6dmwWOUxfMrguj7ZpSeijQAK/w5BUQxEkoHvTKPhcx
 4zD/CxDAJBPgk1NydMPyLO344UYulyWFzYtET5Ub5pxal42wOLsn+W83zwZL+zqgEudx
 SQqG3A+NNqNNTT33p9INoEh4yc3DklM22rw6iR/P93G2drzEtFJ9N8vXBPZl+QLjF2On
 1mqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790340767; x=1790945567;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=9LWDCzcn0ysfmdsUdgkxA//1tZg5vvX+0Vm1HrB/0WM=;
 b=btCYRWLu8PkHmWBBRShrV3aFhNqvnEQv8ZbxKwLyWpZliJyhkIs+CAO3YhY5dS7K4t
 7s8jz0Jjwg5w8A5O2Ecq5aA50Ot5qNNHeISO6EYqR8GzNqiDToItTnjSeyTuMsQZLCOh
 SLvkHMTEedzNZzmdKbo5SbFFISNEni6BRqa6Dhaysr1SqFCWPzsDZ75SHGu0m1sZyNLM
 qpH5i1SQPojHL72MnOWP0OvGCW/pc/ptbVknWERBt0vGQxjWym+e4suJ2FvIHaY/iMrF
 QLAhk10PxeFs3RtnfTVUXSieqr/I7cUSeMeqhdN8vPu4ho7FUrPGxb7cDyYbFHJB6T5+
 9W/g==
X-Forwarded-Encrypted: i=1;
 AKwUvBz+KGBvnND72kbVDRmQ1coWrjgHH6Fiwg8Eq5wsfZIJeyNJ8WvBFoEIWEQrjkEpDauz1G2acp51Y6w=@lists.freedesktop.org
X-Gm-Message-State: AFuF++lt6pkEHBy0XPT5cacKM7ddfXRuhAVIaBUbN+G0oWrSOdMyOCmm
 puUW7CqIjg20e/XUe+cT8iY1WyPVE6mAN9nFx+yKlq6jZSch0M0Z+hWDP5gxtoI/1eOjFDJbvG6
 AcR1aRdMsbtnO/DB0rQKf7Ied5CS58h4=
X-Gm-Gg: AYBFou1ZL0wX65NTUcgu+78/KystTa9uG4MqFTyuwP9M4jJFkuz5lkGxKHdIKLEQhRD
 a2Lq5kjcKao/th/3GaJx802HAAxBsdK8JV+r8Xyh5LpBsxf7WXrTm/7oCGYVp6EabbGjaRAz9iU
 wqkSJ0z+OJa6qir9FHesHJlyBLLnRSSkhamvlaMLPpWHbD8cXT+rpMrLkVgRXWCK4hzoiPwKhrm
 7Cc3OL8fVcnm0KZQUhi1yOztRGUzoxPQ8Y1GusLwW+y2NGDvwvrgvl8d3n1tNJb+bsI0DKj9huE
 mq9nUHv089kQypklaSi4D0J+Bz6tvT1OFGD5RmJU5xhJWeKv5UGkWGBJlA==
X-Received: by 2002:a05:620a:8389:b0:93a:3d22:3122 with SMTP id
 af79cd13be357-93c43cc7043mr442767385a.3.1790340766713; Fri, 25 Sep 2026
 05:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260908044035.62093-1-mario.limonciello@amd.com>
 <20260908044035.62093-3-mario.limonciello@amd.com>
 <0fb724cc-ac12-4502-b338-1c4f310f043a@suse.de>
 <CAFOAJEdFPrwHZV5y1E_u_Wd6oE_viPsPztxYW6PRZHJ-zdPFMQ@mail.gmail.com>
 <ff86caeb-4388-4660-b3c0-ddc42bc274e3@amd.com>
 <b60d3430-ca99-40b6-aaa0-7b8d481ebda6@suse.de>
In-Reply-To: <b60d3430-ca99-40b6-aaa0-7b8d481ebda6@suse.de>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Fri, 25 Sep 2026 14:52:34 +0200
X-Gm-Features: AclHuK_7Zf-6pQcm6muMqKFw6mcOuy1gYopDSlUKmT8vyhgjq4Te-A38Cn1BR-c
Message-ID: <CAFZQkGzUuOh2tGa_otw7yDUd9rSne2PG5Vdte-hwhLZEDf24dA@mail.gmail.com>
Subject: Re: [PATCH v8 02/14] backlight: add kernel-internal backlight API
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, Simona Vetter <simona@ffwll.ch>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, amd-gfx@lists.freedesktop.org, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, Hans de Goede <hansg@kernel.org>, 
 David Herrmann <dh.herrmann@gmail.com>,
 Marta Lofstedt <marta.lofstedt@intel.com>, 
 Mario Limonciello <superm1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Am Di., 22. Sept. 2026 um 14:05 Uhr schrieb Thomas Zimmermann
<tzimmermann@suse.de>:
> > The whole design here is to put the compositor in control.  For
> > example if compositor wants to enforce brightness to be a certain
> > value when certain content is being displayed.
>
> And as I mentioned, it might not be that easy. Sysfs has been the entry
> point to backlight brightness so far AFAIU.
Yes, but this doesn't remove or break the sysfs API for old userspace,
it just allows new userspace to handle things more properly.

> Did you consider treating this similar to display hotplugging?  When the
> user plug a display in or out, the DRM driver sends a message to the
> compositor in user space. [1]  I think it might be possible to do a
> similar thing for changes to brightness.
Notifying the compositor after the fact would not be ok. All the other
display properties are under exclusive control of the process that
holds drm master, backlight being different is one of the problems
fixed by this new API.

- Xaver
